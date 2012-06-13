### ISO-3166 Country Lists with UN Regional Codes

These lists are the result of merging data from two sources, the Wikipedia [ISO 3166-1 article](http://en.wikipedia.org/wiki/ISO_3166-1#Officially_assigned_code_elements) for alpha and numeric country codes, and the [UN Statistics](http://unstats.un.org/unsd/methods/m49/m49regin.htm) site for countries' regional, and sub-regional codes.

The [International Organization for Standardization (ISO)](http://www.iso.org/iso/english_country_names_and_code_elements) site provides partial data (capitalised and sometimes stripped of non-latin ornamentation), but sells the complete data set as a Microsoft Access 2003 database. Other sites give you the numeric and character codes, but there appeared to be no sites that included the associated UN-maintained regional codes in their data sets. I scraped data from the above two websites that is all publicly available already to produce some ready-to-use complete data sets that will hopefully save someone some time who had similar needs.

### What's available?

The data is available in

* JSON
* XML
* CSV

3 versions exist for each format

* `all.format` - Everything I can find, including regional and sub-regional codes
* `slim-2.format` - English name, numeric country code and alpha-2 code (e.g., NZ)
* `slim-3.format` - English name, numeric country code and alpha-3 code (e.g., NZL)

### What does it look like?

Take a peek inside the `all`, `slim-2` and `slim-3` directories for the full lists of JSON, XML and CSV.

Using JSON as an example:

#### all.json

    [
      {
        "name":"New Zealand",
        "alpha-2":"NZ",
        "alpha-3":"NZL",
        "country-code":"554",
        "sub-region-code":"053",
        "region-code":"009",
        "iso_3166-2":"ISO 3166-2:NZ"
      },
      // ...
    ]

#### slim-2.json

    [
      {
        "name":"New Zealand",
        "alpha-2":"NZ",
        "country-code":"554"
      },
      // ...
    ]

#### slim-3.json

    [
      {
        "name":"New Zealand",
        "alpha-2":"NZL",
        "country-code":"554"
      },
      // ...
    ]

### Caveats

1. Please check the data independently for accuracy before using it in any system and for any purpose
1. Although I've tried to ensure the data is as accurate as possible, the data is not authoritative, and so should not be considered accurate

### scrubber.rb

`scrubber.rb` is a dirty Ruby script I used to generate these files. You can run it yourself if you wish to re-generate the files fresh from the sources.

To install the gems in the Gemfile:

    bundle install

To run:

    ruby scrubber.rb

Note, due to file encoding issues the script should only be run using Ruby 1.9 or above.

### Timestamp

* UN Statistical data retrieved 13 June 2012, from a document last revised 20 September 2011
* Wikipedia data retrieved 13 June 2012, from a document last revised 10 May 2012
