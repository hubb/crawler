lib = File.expand_path('..', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'crawler/crawler'
require 'crawler/report'

module Crawler
  def self.crawl(url)
    sitemap = Crawler.map!(url)
    report  = Report.new(sitemap)
    report.print
  end
end