require 'forwardable'

module Crawler
  class Sitemap
    include Enumerable
    extend  Forwardable
    def_delegators :nodes, :each, :push
    alias :add :push

    attr_reader :root, :nodes

    def initialize(root)
      @root  = root
      @nodes = [root]
      yield self if block_given?
    end
  end
end