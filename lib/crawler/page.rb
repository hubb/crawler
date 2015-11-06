require 'uri'
require 'crawler/remote_html_document'

module Crawler
  class Page
    ROOT_PATH  = '/'
    STYLESHEET = 'stylesheet'

    include RemoteHTMLDocument
    attr_reader :url

    def initialize(url)
      @url = URI.parse(url)
    end

    def each_link
      return enum_for(:each_link) unless block_given?

      links.map do |link|
        absolute_url = URI.parse(link).relative? ? url + link : link

        yield absolute_url.to_s
      end
    end

    def assets
      @assets ||= stylesheets + javascripts + images
    end

    def links
      document.css('a')
        .map    { |node| node.attributes["href"].value }
        .reject { |href| !valid_path?(href) }
        .uniq
    end

    def stylesheets
      document.css('link')
        .select { |node| node.attributes["rel"].value == STYLESHEET }
        .map    { |node| node.attributes["href"].value }
        .uniq
    end

    def javascripts
      document.css('script')
        .select { |node| node.attributes["src"] }
        .map    { |node| node.attributes["src"].value }
        .uniq
    end

    def images
      document.css('img')
        .select { |node| node.attributes["src"] }
        .map    { |node| node.attributes["src"].value }
        .uniq
    end

    private
    def valid_path?(path)
      path != ROOT_PATH && path.start_with?(ROOT_PATH)
    end
  end
end