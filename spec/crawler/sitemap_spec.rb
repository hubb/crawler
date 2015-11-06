require 'spec_helper'
require 'crawler/sitemap'
require 'crawler/page'

describe Crawler::Sitemap do
  let(:root) { Crawler::Page.new('http://foo.bar') }
  subject(:sitemap) { described_class.new(root) }

  it { expect(sitemap).to respond_to(:root) }
  it { expect(sitemap).to respond_to(:nodes) }
  it { expect(sitemap).to respond_to(:add) }
  it { expect(sitemap).not_to respond_to(:root=) }
  it { expect(sitemap).not_to respond_to(:links) }
  it { expect(sitemap).to be_a(Enumerable) }

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
    it { expect(sitemap.root).to be_a(Crawler::Page) }
  end

  describe 'adding nodes' do
    let(:page) { Crawler::Page.new('http://foo.bar/baz') }

    it 'push the Page to the nodes' do
      expect { sitemap.add(page) }
        .to change { sitemap.nodes }
        .to([root, page])
    end
  end
end