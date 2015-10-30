require 'forwardable'

module GoCrawler
  class Sitemap
    include Enumerable
    extend  Forwardable
    def_delegators :nodes, :each

    attr_reader :root

    def initialize(root)
      @root  = root
      @nodes = [root]
      yield self if block_given?
    end

    def add(page)
      @nodes << page
    end

    def nodes
      @nodes
    end
  end
end