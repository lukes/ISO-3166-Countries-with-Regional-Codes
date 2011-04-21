About
-----

**NOTE - the lists are still being developed and checked for accuracy. Please do not use in production yet**

These lists are the result of merging data from two sources, the Wikipedia [ISO 3166-1 article](http://en.wikipedia.org/wiki/ISO_3166-1#Officially_assigned_code_elements) for alpha and numeric country codes, and the [UN Statistics](http://unstats.un.org/unsd/methods/m49/m49regin.htm) site for countries' regional, and sub-regional codes.

### What's available?

#### Formats

The data is made available in

* JSON
* XML
* CSV

3 versions exist for each format

* `all.format` - Everything I can find, including regional and sub-regional codes
* `slim-2.format` - English name, numeric country code and alpha-2 (e.g., US) code
* `slim-3.format` - English name, numeric country code and alpha-3 (e.g., USA) code

    {
      "name":"Afghanistan",        // english name
      "country-code":"004",        // unique numeric code
      "alpha-2":"AF",              // unique 2-character code
      "alpha-3":"AFG",             // unique 3-character code
      "sub-region-code":"034",     // geographical sub-region code
      "region-code":"142",         // macro geographical (continental) region code
      "iso 3166-2":"ISO 3166-2:AF" // ISO 3166-2 code for principle subdivision
    }

### Legality

Although it seems because of their universality that a complete data set should be freely available, [International Organization for Standardization (ISO)](http://www.iso.org/iso/english_country_names_and_code_elements) only provide small amounts of the data for free. If you want more, you need to purchase it. 

Hence, I'm not certain of the legality of putting this data online, suffice to say that the data is all publicly available already, just not in a ready-to-use form.



Why use the Wikipedia as a source? It was the only decent source that provided alpha-2, alpha-3, numeric country code, and sensibly formatted English name in a single place, and should be up-to-date.

Before making this list, I couldn't find a single place that had a complete list containing:

* English name
* Alpha

The regional and sub-regional codes can be used when interacting with the [Google Geomap API](http://code.google.com/apis/visualization/documentation/gallery/geomap.html).



Data Age
-------

UN Statistical data retrieved 21 April 2011, from a document last revised 17 February 2011.
Wikipedia data retrieved 21 April 2011, from a document last revised 8 April 2011.

Caveats
-------

Please check the data independently for accuracy before using them in any system. 

Although I've tried to ensure the data is as accurate as possible, the data is not authoritative, and should not be considered accurate.

TODOs
-----

* French names
