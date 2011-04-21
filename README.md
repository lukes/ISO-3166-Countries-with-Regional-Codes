In Development
--------------

**NOTE - the lists are still being developed and checked for accuracy. Please do not use in production yet**

I'm also aware that the character encoding has gone through the wringer.

About
-----

These lists are the result of merging data from two sources, the Wikipedia [ISO 3166-1 article](http://en.wikipedia.org/wiki/ISO_3166-1#Officially_assigned_code_elements) for alpha and numeric country codes, and the [UN Statistics](http://unstats.un.org/unsd/methods/m49/m49regin.htm) site for countries' regional, and sub-regional codes.

### What's available?

The data is available in

* JSON
* XML
* CSV

3 versions exist for each format

* `all.format` - Everything I can find, including regional and sub-regional codes
* `slim-2.format` - English name, numeric country code and alpha-2 code (e.g., US)
* `slim-3.format` - English name, numeric country code and alpha-3 code (e.g., USA)

### Huh?

The [International Organization for Standardization (ISO)](http://www.iso.org/iso/english_country_names_and_code_elements) site provides partial data (capitalised and sometimes stripped of non-latin ornamentation), but sells the complete data set as a Microsoft Access 2003 database. Other sites give you the numeric and character codes, but none seemed to include the UN-maintained regional codes, which I needed for the [Google Geomap API](http://code.google.com/apis/visualization/documentation/gallery/geomap.html).

So I took data that is all publicly available already, just not in a single and ready-to-use form. After making a pretty complete merge, I figured I should polish it up and make the data available to others.

### Data Fidelity

* UN Statistical data retrieved 21 April 2011, from a document last revised 17 February 2011
* Wikipedia data retrieved 21 April 2011, from a document last revised 8 April 2011.

#### Caveats

1. Please check the data independently for accuracy before using it in any system and for any purpose
2. Although I've tried to ensure the data is as accurate as possible, the data is not authoritative, and so should not be considered accurate
