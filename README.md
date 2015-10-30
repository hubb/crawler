# GoCardless coding exercise

## Exercise

We'd like you to write a simple web crawler, in whatever language you're most comfortable in, which given a URL to crawl, should output a site map, showing the static assets for each page. We'd love it if you could also include a README file which explains your design decisions and any parts you found particularly challenging or interesting.

It should be limited to one domain - so when crawling gocardless.com it would crawl all pages within the gocardless.com domain, but not follow the links to our Facebook and Twitter accounts. We’ll be testing it against gocardless.com.

We will be looking to see if the crawler meets these requirements, and also to see if it meets and excels at least one of the following areas: robustness, performance, testing and code structure & layout.

It usually takes around 2 to 3 hours, but don't worry if you feel you want to spend a bit longer on it.

### Install & usage

Ensure `bin/gocrawler` is executable or run `chmod +x bin/gocrawler`.

Install the dependencies (`nokogiri`) with `bundle install --without=development test`.

Run with `bin/gocrawler https://gocardless.com`

### Implementations


**RemoteHTMLDocument**

- fails if the base doesn't respond to `url`
- defines an accessor to an `html_parser` for the instance
  - can be switched to anything responding to `call` with a single `String` argument
  - default to `Nokogiri::HTML.parse` because parsing HTML is really not fun :(
- exposes the `html` from the remote `url`
- exposes a parsed `document` 

**Page**

- receives a url
- includes `RemoteHTMLDocument`
- exposes the desired elements of the page
  - exposes the `assets` of the page (`stylesheets`, `javascripts` & `images`)
  - exposes the `stylesheets`
  - exposes the `javascripts`
  - exposes the `images`
  - exposes only the relative `links`
  - can yield `each_link`

**Sitemap**

- receives a `root` object (`Page`)
- sets a `nodes` instance variable to an Array containing the `root`
  - a better store would be something like a directed graph
- exposes the `nodes`
- can `add` more `Page` to `nodes` (an `Array`, which could be replaced by a graph if we wanted to recursively parse every link on the page)
- iterates over each node by calling `each` directly on the sitemap

**Crawler**

- receives a `url`
- builds and exposes the `sitemap` for the given url
- easy access class method `map!`

**Report**

- output the sitemap to the console
- iterates over each node of the sitemap
- prints the number of assets and the asset file names