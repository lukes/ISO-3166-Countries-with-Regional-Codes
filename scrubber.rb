# encoding: UTF-8

require 'rubygems'
require 'hpricot'
require 'nokogiri'
require 'open-uri'
require 'openssl'
require 'json'
require 'csv'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/object/try'
require 'active_support/core_ext/array/conversions' #converting json to xml
require 'htmlentities'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

entities = HTMLEntities.new

wikipedia_page = "https://en.wikipedia.org/wiki/ISO_3166-1"
un_page = "http://unstats.un.org/unsd/methods/m49/m49regin.htm"

puts "Fetching data from Wikipedia table #{wikipedia_page}..."

doc = Hpricot(open(wikipedia_page).read)

# array that will hold the iso 3166 data
codes = []

# numbers have to be strings to preserve leading 0s

puts "Extracting data from wiki table"

doc.search("table.sortable tr").each do |row|
  tds = row.search("td")
  country = {}
  country["name"] = entities.decode(tds[0].search("a").inner_html.strip) rescue nil
#  puts country["name"].encoding unless country["name"].nil?
  country["alpha-2"] = entities.decode(tds[1].search("span").inner_html.strip) rescue nil
  country["alpha-3"] = entities.decode(tds[2].search("span").inner_html.strip) rescue nil
  country["country-code"] = entities.decode(tds[3].search("span").inner_html.strip) rescue nil
  country["iso_3166-2"] = entities.decode(tds[4].search("a").inner_html.strip) rescue nil
  codes << country unless country.values.any?{ |v| v.nil? }
end

puts "  Data for #{codes.size} countries found\n"

# full doc
# http://en.wikipedia.org/wiki/ISO_3166-1#Information_included

# note ISO doesn't give away all information for free - so refer to the Wikipedia table (assuming it is mostly kept up to date)

puts "Fetching data from UN table #{un_page}..."

#doc = Hpricot(open(un_page).read.force_encoding("UTF-8"))
#doc = Nokogiri::XML(open(un_page).read)
doc = Nokogiri::HTML(open(un_page))

region_name = nil
region_code = nil
sub_region_name = nil
sub_region_code = nil
found_table = false

#doc.css("table [text()*=Numerical code]")[0].css("tr").each do |row|
doc.css("table[width='100%']")[2].css("tr").each do |row|

  # table has more sections than we want, like row
  # of "Developed and developing regions" code. look for
  # the next instance of td.header2 after we've started
  # finding results, and end the loop when found
  if !row.css("td.cheader2").blank? && found_table
    break
  end

  tds = row.css("td")

  next if tds[0].blank?

  # get the code number
  code = tds[0].css("p")[0].try(:inner_html).try(:strip)
  code = tds[0].css("p span").inner_html.strip if code.blank?
  code = tds[0].inner_html.strip if code.blank? # certain codes aren't wrapped in a <p>
  next unless code.match(/^\d+\Z/)

  # detemine what kind of row this is
  # is this a region row?
  region = tds[1].css("h3 b")
  unless region.blank?
    region.css("a").remove # remove the empty <a>
    unless region.css("span").blank?
      region = region.css("span") # remove wayward <span> (appearing on first Africa result)
    end
    region = region.inner_html.strip
    region = entities.decode(region)
    unless region.nil? || region.blank?
      found_table = true
      region_code = code
      region_name = region
      puts "#{region_name}: #{region_code}"
      next
    end
  end
  # is this a subregion row?
  sub_region = tds[1].css("b").inner_html.strip
  unless sub_region.blank?
    sub_region = entities.decode(sub_region)
    sub_region_code = code
    sub_region_name = sub_region
    puts "  #{sub_region_name}: #{sub_region_code}"
    next
  end
  # is this a country row?
  country = tds[1].css("p").inner_html.strip
  country = tds[1].css("p span").inner_html.strip if country.blank?
  country = tds[1].inner_html.strip if country.blank?

  unless country.blank? || !country.match(/^[A-Z]/)
    # find this country in our array and modify in place
    codes.each_with_index do |element, i|
      if element["country-code"] == code
        codes[i]["region"] = region_name
        codes[i]["sub-region"] = sub_region_name
        codes[i]["region-code"] = region_code
        codes[i]["sub-region-code"] = sub_region_code
        break
      end
    end
    country = entities.decode(country)
    puts "    #{country}: #{code}"
  end

end

# For ISO data from the Wikipedia page that we couldn't correlate with
# regional codes from the UN, give them blank data.
codes.select{ |c| c["region-code"].nil? }.map do |c|
  c["region"] = c["sub-region"] = c["region-code"] = c["sub-region-code"] = nil
end

puts "Writing files..."

def json_to_csv(json)
  headers = JSON.parse(json).first.collect {|k,v| k}.join(',') + "\n"

  csv = CSV.generate do |csv|
    JSON.parse(json).each do |hash|
      csv << hash.values
    end
  end

  headers + csv
end

def json_to_xml(json)
  JSON.parse(json).to_xml(root: "countries", skip_types: true)
end

json = codes.to_json

File.open("all/all.json", "w:UTF-8") { |f| f.write(json) }
File.open("all/all.csv", "w:UTF-8") { |f| f.write(json_to_csv(json)) }
File.open("all/all.xml", "w:UTF-8") { |f| f.write(json_to_xml(json)) }

# write slimmer versions
slim_2 = codes.map do |c|
  {"name" => c["name"], "alpha-2" => c["alpha-2"], "country-code" => c["country-code"]}
end
json = slim_2.to_json
File.open("slim-2/slim-2.json", "w:UTF-8") { |f| f.write(json) }
File.open("slim-2/slim-2.csv", "w:UTF-8") { |f| f.write(json_to_csv(json)) }
File.open("slim-2/slim-2.xml", "w:UTF-8") { |f| f.write(json_to_xml(json)) }

# write slimmer versions
slim_3 = codes.map do |c|
  {"name" => c["name"], "alpha-3" => c["alpha-3"], "country-code" => c["country-code"]}
end
json = slim_3.to_json
File.open("slim-3/slim-3.json", "w:UTF-8") { |f| f.write(json) }
File.open("slim-3/slim-3.csv", "w:UTF-8") { |f| f.write(json_to_csv(json)) }
File.open("slim-3/slim-3.xml", "w:UTF-8") { |f| f.write(json_to_xml(json)) }

puts "\nCouldn't find regional table data to save in all.csv, all.json and all.xml for the following countries (you may want to manually check #{un_page}) -- sorry!:\n\n"

codes.select{ |c| c["region-code"].nil? }.each {|c| puts c.inspect }

File.open("LAST_UPDATED.txt", "w:UTF-8") { |f| f.write(Time.now.to_s) }
