# GoCardless coding exercise

## Exercise

We'd like you to write a simple web crawler, in whatever language you're most comfortable in, which given a URL to crawl, should output a site map, showing the static assets for each page. We'd love it if you could also include a README file which explains your design decisions and any parts you found particularly challenging or interesting.

It should be limited to one domain - so when crawling gocardless.com it would crawl all pages within the gocardless.com domain, but not follow the links to our Facebook and Twitter accounts. We’ll be testing it against gocardless.com.

We will be looking to see if the crawler meets these requirements, and also to see if it meets and excels at least one of the following areas:
- robustness
- performance
- testing
- code structure & layout.

It usually takes around 2 to 3 hours, but don't worry if you feel you want to spend a bit longer on it.

## Implementations

-> URL -> Sitemap with list of assets

### Ingredients

- a Crawler which given a URL
  - returns the html from this page
- a Page which given the raw HTML
  - exposes all the static assets
  - exposes all the links
- a data structure to store the Sitemap
- a way of rendering this Sitemap
- a Bot which given a URL
  - create a new Sitemap
  - add as root the page for the given urls
  - for every links in page
    - add the page to the sitemap
- a CLI to interface with the Bot
  - accept a url as single argument
  - output the sitemap with
    - path to the page
    - static assets on the page


### API

bot = Bot.new(url: url, follow_links: true)
bot.crawl
report = SitemapReport.new(bot.sitemap)
report.render

