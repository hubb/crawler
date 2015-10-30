require 'spec_helper'
require 'go_crawler/sitemap'
require 'go_crawler/page'

describe GoCrawler::Sitemap do
  let(:root) { GoCrawler::Page.new('http://foo.bar') }
  subject(:sitemap) { described_class.new(root) }

  it { expect(sitemap).to respond_to(:root) }
  it { expect(sitemap).not_to respond_to(:root=) }
  it { expect(sitemap).not_to respond_to(:links) }

  describe 'initialize' do
    it { expect(sitemap).to be_a(described_class) }

    context 'when a block is given' do
      it 'yields itself to the block' do
        described_class.new(root) do |s|
          expect(s).to be_a(described_class)
        end
      end
    end
  end

  describe 'root' do
    it { expect(sitemap.root).to be_a(GoCrawler::Page) }
  end

  describe 'adding nodes' do
    let(:page) { GoCrawler::Page.new('http://foo.bar/baz') }
    before     { sitemap.add(page) }

    it { expect(sitemap).to be_a(Enumerable) }
    it { expect(sitemap.each.to_a).to include(page) }
  end
end