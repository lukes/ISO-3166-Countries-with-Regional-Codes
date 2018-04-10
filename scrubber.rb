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

WIKIPEDIA_URI = "https://en.wikipedia.org/wiki/ISO_3166-1"
UN_URI = "https://unstats.un.org/unsd/methodology/m49/overview/"

puts "Fetching data from Wikipedia table #{WIKIPEDIA_URI}..."

doc = Hpricot(open(WIKIPEDIA_URI).read)

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
  codes << country unless country.values.any?(&:blank?)
end

puts "  Data for #{codes.size} countries found\n"

# full doc
# http://en.wikipedia.org/wiki/ISO_3166-1#Information_included

# note ISO doesn't give away all information for free - so refer to the Wikipedia table (assuming it is mostly kept up to date)

puts "Fetching data from UN table #{UN_URI}..."

doc = Nokogiri::HTML(open(UN_URI));

doc.css("table#downloadTableEN tbody").css("tr").each do |row|

  _, _, region_code, region_name, sub_region_code, sub_region_name, intermediate_region_code, intermediate_region_name, country, _, iso_alpha_3 = row.css("td").map{|td| td.inner_html.strip }

  # find this country in our array and modify in place
  codes.each_with_index do |element, i|
    if element["alpha-3"] == iso_alpha_3
      codes[i]["region"] = entities.decode(region_name)
      codes[i]["sub-region"] = entities.decode(sub_region_name)
      codes[i]["intermediate-region"] = entities.decode(intermediate_region_name)
      codes[i]["region-code"] = region_code
      codes[i]["sub-region-code"] = sub_region_code
      codes[i]["intermediate-region-code"] = intermediate_region_code
      break
    end
  end
  # puts "\t#{entities.decode(country)}: #{iso_alpha_3}"
end

# For ISO data from the Wikipedia page that we couldn't correlate with
# regional codes from the UN, give them blank data.
blanks = codes.select do |c|
  # (note, don't consider intermediate region data as required)
  c.slice("alpha-3", "region", "sub-region", "region-code", "sub-region-code").values.any?(&:blank?) ||
  !["alpha-3", "region", "sub-region", "region-code", "sub-region-code"].all? {|k| c.key?(k) }
end

# Ensure they have all the keys (we'll write them to the data files with blank values)
blanks.map! do |c|
  c["region"] = c["sub-region"] = c["intermediate-region"] = c["region-code"] = c["sub-region-code"] = c["intermediate-region-code"] = nil
  c
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

puts "Done."

if blanks.present?
  puts "\nThere was some missing data for the following countries (you may want to manually check #{UN_URI}):\n\n"
  puts blanks.each(&:inspect)
end

File.open("LAST_UPDATED.txt", "w:UTF-8") { |f| f.write(Time.now.to_s) }
