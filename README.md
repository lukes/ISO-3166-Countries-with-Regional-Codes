About
-----

**NOTE - the lists are still being developed and checked for accuracy. Please do not use in production yet**

These lists are the result of merging data from two sources, the Wikipedia [ISO 3166-1 article](http://en.wikipedia.org/wiki/ISO_3166-1#Officially_assigned_code_elements) for alpha and numeric country codes, and the [UN Statistics](http://unstats.un.org/unsd/methods/m49/m49regin.htm) site for countries' regional, and sub-regional codes.

All the data is all publicly available already, just not in a single and ready-to-use form.

### What's available?

The data is available in

* JSON
* XML
* CSV

3 versions exist for each format

* `all.format` - Everything I can find, including regional and sub-regional codes
* `slim-2.format` - English name, numeric country code and alpha-2 (e.g., US) code
* `slim-3.format` - English name, numeric country code and alpha-3 (e.g., USA) code

### Huh?

Yeah I didn't expect to provide something like this either.

When looking for a source of some JSON I could copy and paste that would give me a country's name, numeric code, and regional code in one place, for the [Google Geomap API](http://code.google.com/apis/visualization/documentation/gallery/geomap.html), I found one didn't exist.

I checked the [International Organization for Standardization (ISO)](http://www.iso.org/iso/english_country_names_and_code_elements) site, and found that despite this standard's universality (and hence importance for the generally ability to use country data programmatically) that you could download partial data, but complete data had to be purchased in Microsoft Access 2003 format.

Age of Data
-------

* UN Statistical data retrieved 21 April 2011, from a document last revised 17 February 2011
* Wikipedia data retrieved 21 April 2011, from a document last revised 8 April 2011.

Caveats
-------

Please check the data independently for accuracy before using them in any system. 

Although I've tried to ensure the data is as accurate as possible, the data is not authoritative, and should not be considered accurate.

TODOs
-----

* French names
