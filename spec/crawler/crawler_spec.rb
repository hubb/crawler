require 'spec_helper'
require 'crawler/crawler'

describe Crawler::Crawler do
  subject(:crawler) { described_class.new('https://www.gocardless.com') }
  it { expect(described_class).to respond_to(:map!) }
  it { expect(crawler).to respond_to(:sitemap) }
  it { expect(crawler).to respond_to(:url) }
  it { expect(crawler).to respond_to(:root) }
  
  describe 'map!' do
    it { expect(described_class.map!('https://www.gocardless.com'))
        .to be_a(Crawler::Sitemap) }
  end

  describe 'url' do
    it { expect(crawler.url).to be_a(String) }
    it { expect(crawler).not_to respond_to(:url=) }
  end

  describe 'root' do
    it { expect(crawler.root).to be_a(Crawler::Page) }
    it { expect(crawler.root).to respond_to(:each_link) }
  end

  describe 'sitemap' do
    it { expect(crawler.sitemap).to be_a(Crawler::Sitemap) }
    it { expect(crawler.sitemap).to respond_to(:add) }
  end
end