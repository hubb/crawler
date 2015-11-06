require 'open-uri'
require 'nokogiri'

module Crawler
  module RemoteHTMLDocument
    attr_writer :html_parser

    def included(base)
      unless base.respond_to?(:url)
        fail 'Your base model should expose a #url method'
      end
    end

    def document
      @document ||= html_parser.call(html)
    end

    def html
      open(url,
        "User-Agent" => "Crawler - GoCardless coding exercise bot. Ruby/#{RUBY_VERSION}",
        "From"       => "thibault.gautriaud@gmail.com",
        "Referer"    => "https://gocardless.com/about/jobs/software-engineer/"
      ).read
    rescue SocketError => e
      "<html><body>Unable to fetch #{ url }, reason #{ e.message }}</body></html>"
    end

    private
    def html_parser
      @html_parser ||= Nokogiri::HTML.public_method(:parse)
    end
  end
end