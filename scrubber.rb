#!/usr/bin/env ruby
# requires Ruby 1.9

require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'active_support/all' # converting json to xml
require 'htmlentities'

wikipedia_page = "http://en.wikipedia.org/wiki/ISO_3166-1"
un_page = "http://unstats.un.org/unsd/methods/m49/m49regin.htm"

entities = HTMLEntities.new

puts "Fetching data from Wikipedia table #{wikipedia_page}..."

doc = Hpricot(open(wikipedia_page).read)

# array that will hold the iso 3166 data
codes = []

# numbers have to be strings to preserve leading 0s

puts "Extracting data from table"

doc.search("table.sortable tr").each do |row|
  tds = row.search("td")
  country = {}
  country["name"] = entities.decode(tds[0].search("a").inner_html.strip) rescue nil
  country["alpha-2"] = entities.decode(tds[1].search("tt").inner_html.strip) rescue nil  
  country["alpha-3"] = entities.decode(tds[2].search("tt").inner_html.strip) rescue nil  
  country["country-code"] = entities.decode(tds[3].search("tt").inner_html.strip) rescue nil
  country["iso_3166-2"] = entities.decode(tds[4].search("a").inner_html.strip) rescue nil
  puts country["name"] unless country["name"].nil?
  codes << country unless country.values.any?{ |v| v.nil? }
end

puts "  Data for #{codes.size} countries found\n"

# full doc
# http://en.wikipedia.org/wiki/ISO_3166-1#Information_included

# note ISO doesn't give away all information for free - so refer to the Wikipedia table (assuming it is mostly kept up to date)

puts "Fetching data from UN table #{un_page}..."

doc = Hpricot(entities.decode(open(un_page).read.force_encoding("iso-8859-1")))

region_code = nil
sub_region_code = nil
found_table = false

doc.search("table [text()*=Numerical code]")[0].search("tr").each do |row|
  # table has more sections than we want, like row 
  # of  "Developed and developing regions" code. look for
  # the next instance of td.header2 after we've started
  # finding results, and end the loop when found
  if !row.search("td.cheader2").empty? && found_table
    break
  end
  
  tds = row.search("td")
  
  # get the code number
  code = tds[0].search("p").inner_html.strip
  code = tds[0].search("p span").inner_html.strip if code.empty?
  code = tds[0].inner_html.strip if code.empty? # certain codes aren't wrapped in a <p>
  next unless code.match(/^\d+\Z/)
  
  # detemine what kind of row this is
  # is this a region row?
  region = tds[1].search("h3 b")
  unless region.empty?
    region.search("a").remove # remove the empty <a>
    unless region.search("span").empty?
      region = region.search("span") # remove wayward <span> (appearing on first Africa result)
    end
    region = region.inner_html.strip
    region = entities.decode(region)
    unless region.nil? || region.empty?
      found_table = true
      region_code = code
      puts "#{region}: #{region_code}"
      next
    end
  end
  # is this a subregion row?
  sub_region = tds[1].search("b").inner_html.strip
  unless sub_region.empty?
    sub_region = entities.decode(sub_region)
    sub_region_code = code
    puts "  #{sub_region}: #{sub_region_code}"
    next
  end
  # is this a country row?
  country = tds[1].search("p").inner_html.strip
  country = tds[1].search("p span").inner_html.strip if country.empty?
  country = tds[1].inner_html.strip if country.empty?
  unless country.empty? || !country.match(/^[A-Z]/)
    # find this country in our array and modify in place
    codes.each_with_index do |element, i|
      if element["country-code"] == code
        codes[i]["region-code"] = region_code
        codes[i]["sub-region-code"] = sub_region_code
        break
      end
    end
    country = entities.decode(country)
    puts "    #{country}: #{code}"
  end
end

puts "Writing files..."

json = codes.to_json
csv = JSON.parse(json).first.collect {|k,v| k}.join(',') + "\n"
csv += JSON.parse(json).collect {|node| "#{node.collect{|k,v| v.gsub(',', '\,')}.join(',')}\n"}.join
File.open("all/all.json", "w") { |f| f.write(json) }
File.open("all/all.csv", "w") { |f| f.write(csv) }
File.open("all/all.xml", "w") { |f| f.write(ActiveSupport::JSON.decode(json).to_xml(:root => "countries")) }

# write slimmer versions
slim_2 = codes.map do |c|
  {"name" => c["name"], "alpha-2" => c["alpha-2"], "country-code" => c["country-code"]}
end
json = slim_2.to_json
csv = JSON.parse(json).first.collect {|k,v| k}.join(',') + "\n"
csv += JSON.parse(json).collect {|node| "#{node.collect{|k,v| v.gsub(',', '\,')}.join(',')}\n"}.join
File.open("slim-2/slim-2.json", "w") { |f| f.write(json) }
File.open("slim-2/slim-2.csv", "w") { |f| f.write(csv) }
File.open("slim-2/slim-2.xml", "w") { |f| f.write(ActiveSupport::JSON.decode(json).to_xml(:root => "countries")) }

# write slimmer versions
slim_3 = codes.map do |c|
  {"name" => c["name"], "alpha-3" => c["alpha-3"], "country-code" => c["country-code"]}
end
json = slim_3.to_json
csv = JSON.parse(json).first.collect {|k,v| k}.join(',') + "\n"
csv += JSON.parse(json).collect {|node| "#{node.collect{|k,v| v.gsub(',', '\,')}.join(',')}\n"}.join
File.open("slim-3/slim-3.json", "w") { |f| f.write(json) }
File.open("slim-3/slim-3.csv", "w") { |f| f.write(csv) }
File.open("slim-3/slim-3.xml", "w") { |f| f.write(ActiveSupport::JSON.decode(json).to_xml(:root => "countries")) }

puts "\nCountries that no regional table data was found for (you may want to manually check #{un_page}) -- sorry!:\n\n"

codes.select{ |c| c["region-code"].nil? }.each {|c| puts c.inspect }