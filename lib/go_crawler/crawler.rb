require 'open-uri'
require 'go_crawler/page'
require 'go_crawler/sitemap'

module GoCrawler
  class Crawler
    attr_reader :url, :root

    def self.map!(url)
      new(url).sitemap
    end

    def initialize(url)
      @url  = url
      @root = Page.new(url)
    end

    def sitemap
      @sitemap ||= Sitemap.new(root) do |s|
        root.each_link { |link| s.add(Page.new(link)) }
      end
    end
  end
end