# Crawler [![Build Status](https://travis-ci.org/hubb/crawler.svg?branch=master)](https://travis-ci.org/hubb/crawler)

A simple web page crawler, given a URL, will output a site map showing the static assests for each page.
It should not visit external links.

### Install & usage

Ensure `bin/crawler` is executable or run `chmod +x bin/crawler`.

Install the dependencies (`nokogiri`) with `bundle install --without=development test`.

Run with `bin/crawler https://gocardless.com`

```
% ./bin/crawler https://gocardless.com
--------------------------------------------------------------------------------
Sitemap
--------------------------------------------------------------------------------
-> https://gocardless.com
  + Total assets: 14
  + Javascripts: 3
    - //cdn.optimizely.com/js/125150657.js
    - /bundle/main-7d6df4e3894acdf00d6e.js
    - //www.googletagmanager.com/gtm.js?id=GTM-PRFKNC
  + Stylesheets: 1
    - /bundle/main-7d6df4e3894acdf00d6e.css
  + Images: 10
    - /images/logos/pro-logos@2x.png
    - /images/flags/GB-flag-icon@2x.png
    - /images/flags/BE-flag-icon@2x.png
    - /images/flags/DE-flag-icon@2x.png
    - /images/flags/ES-flag-icon@2x.png
    - /images/flags/EU-flag-icon@2x.png
    - /images/flags/FR-flag-icon@2x.png
    - /images/flags/IE-flag-icon@2x.png
    - /images/flags/NL-flag-icon@2x.png
    - /images/flags/SE-flag-icon@2x.png

-> https://gocardless.com/features/
  + Total assets: 19
  + Javascripts: 3

[...]
```

### Development

```
$ git clone git@github.com:hubb/crawler.git
$ cd crawler
$ bundle install
$ bundle exec rspec
```

### License

MIT, see [LICENSE](https://github.com/hubb/crawler/blob/master/LICENSE)
