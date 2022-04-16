# encoding: UTF-8

require 'nokogiri'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/array/conversions' # Converting json to xml
require 'open-uri'
require 'openssl'
require 'json'
require 'csv'
require 'htmlentities'

WIKIPEDIA_URI = "https://en.wikipedia.org/wiki/ISO_3166-1"
UN_URI = "https://unstats.un.org/unsd/methodology/m49/overview"

DECODE_ENTITIES = HTMLEntities.new.method(:decode)

warn_level = $VERBOSE
$VERBOSE = nil
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
$VERBOSE = warn_level

puts "Fetching data from Wikipedia #{WIKIPEDIA_URI}..."

# Array that will hold the iso 3166 data
data = []

doc = Nokogiri::HTML(URI.open(WIKIPEDIA_URI));

puts "Extracting data from Wikipedia"

doc.css("table.sortable tr").each do |row|
  country_name, iso_alpha_2, iso_alpha_3, country_code, iso_3166_2 = row.css("td")

  next if country_name.blank?

  country_name.search("span.flagicon").remove # Remove the flags from country column

  country = {}
  country["name"] = DECODE_ENTITIES.call(country_name.css("a").first.inner_html.strip) rescue nil
  country["alpha-2"] = DECODE_ENTITIES.call(iso_alpha_2.css("span").inner_html.strip) rescue nil
  country["alpha-3"] = DECODE_ENTITIES.call(iso_alpha_3.css("span").inner_html.strip) rescue nil
  country["country-code"] = DECODE_ENTITIES.call(country_code.css("span").inner_html.strip) rescue nil
  country["iso_3166-2"] = DECODE_ENTITIES.call(iso_3166_2.css("a").inner_html.strip) rescue nil

  data << country unless country.values.any?(&:blank?)
end

puts "  Data for #{data.size} countries found"
puts "Fetching data from UN #{UN_URI}..."

doc = Nokogiri::HTML(URI.open(UN_URI));

puts "Extracting data from UN"

doc.css("table#downloadTableEN tbody").css("tr").each do |row|
  _, _, region_code, region_name, sub_region_code, sub_region_name, intermediate_region_code, intermediate_region_name, country_name, _, iso_alpha_2 = row.css("td").map{|td| td.inner_html.strip }

  # find this country in our data from Wikipedia and merge in the regional data from the UN
  country = data.find { |d| d["alpha-2"] == iso_alpha_2 }

  if country.nil?
    puts "  #{DECODE_ENTITIES.call(country_name)} found in UN source but not in Wikipedia source"
  else
    country.merge!({
      "region" => DECODE_ENTITIES.call(region_name),
      "sub-region" => DECODE_ENTITIES.call(sub_region_name),
      "intermediate-region" => DECODE_ENTITIES.call(intermediate_region_name),
      "region-code" => region_code,
      "sub-region-code" => sub_region_code,
      "intermediate-region-code" => intermediate_region_code
    })
  end
end

# ISO data from the Wikipedia page that we couldn't correlate with regional codes from the UN
blanks = data.select do |d|
  # (Note, don't consider intermediate region data as required)
  d.slice("alpha-3", "region", "sub-region", "region-code", "sub-region-code").values.any?(&:blank?) ||
  !["alpha-3", "region", "sub-region", "region-code", "sub-region-code"].all? { |k| d.key?(k) }
end

# Ensure they have all the keys (we'll write them to the data files with blank values)
blanks.map! do |b|
  b["region"] ||= nil
  b["sub-region"] ||= nil
  b["intermediate-region"] ||= nil
  b["region-code"] ||= nil
  b["sub-region-code"] ||= nil
  b["intermediate-region-code"] ||= nil
  b
end

if blanks.present?
  puts
  puts "There is missing data for #{blanks.size} countries"
  puts "You may want to manually check #{UN_URI}"
  puts
  puts blanks.each(&:inspect)
end

puts
puts "Writing files..."

def json_to_csv(json)
  headers = JSON.parse(json).first.keys.join(',') + "\n"

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

# All
json = data.to_json
File.open("all/all.json", "w:UTF-8") { |f| f.write(json) }
File.open("all/all.csv", "w:UTF-8") { |f| f.write(json_to_csv(json)) }
File.open("all/all.xml", "w:UTF-8") { |f| f.write(json_to_xml(json)) }

# Slim 2
slim_2 = data.map do |c|
  {"name" => c["name"], "alpha-2" => c["alpha-2"], "country-code" => c["country-code"]}
end
json = slim_2.to_json
File.open("slim-2/slim-2.json", "w:UTF-8") { |f| f.write(json) }
File.open("slim-2/slim-2.csv", "w:UTF-8") { |f| f.write(json_to_csv(json)) }
File.open("slim-2/slim-2.xml", "w:UTF-8") { |f| f.write(json_to_xml(json)) }

# Slim 3
slim_3 = data.map do |c|
  {"name" => c["name"], "alpha-3" => c["alpha-3"], "country-code" => c["country-code"]}
end
json = slim_3.to_json
File.open("slim-3/slim-3.json", "w:UTF-8") { |f| f.write(json) }
File.open("slim-3/slim-3.csv", "w:UTF-8") { |f| f.write(json_to_csv(json)) }
File.open("slim-3/slim-3.xml", "w:UTF-8") { |f| f.write(json_to_xml(json)) }

# Last updated
File.open("LAST_UPDATED.txt", "w:UTF-8") { |f| f.write(Time.now.to_s) }

puts "Done"
