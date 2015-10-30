lib = File.expand_path('..', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'go_crawler/crawler'
require 'go_crawler/report'

module GoCrawler
  def self.crawl(url)
    sitemap = Crawler.map!(url)
    report  = Report.new(sitemap)
    report.print
  end
end