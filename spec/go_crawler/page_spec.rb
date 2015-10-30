require 'spec_helper'
require 'go_crawler/page'

describe GoCrawler::Page do
  let(:html)     { File.read(File.expand_path('../../support/index.html', __FILE__)) }
  subject(:page) { described_class.new('http://foo.bar') }
  
  before do
    allow(page).to receive(:html).and_return(html)
  end
  
  it { expect(page).to     respond_to(:url) }
  it { expect(page).not_to respond_to(:url=) }
  it { expect(page).to respond_to(:links) }
  it { expect(page).to respond_to(:assets) }

  describe 'url' do
    it { expect(page.url).to be_a(URI) }
  end

  describe 'assets' do  
    it { expect(page.assets).to be_a(Enumerable) }
    it { expect(page.assets).not_to be_empty }
  end

  describe 'links' do
    it { expect(page.links).to be_a(Enumerable) }
    it { expect(page.assets).not_to be_empty }
  end

  describe 'stylesheets' do
    it { expect(page.stylesheets).to respond_to(:+) }
    it { expect(page.stylesheets).to be_a(Enumerable) }
    it { expect(page.stylesheets).not_to be_empty }
  end
  
  describe 'javascripts' do
    it { expect(page.javascripts).to respond_to(:+) }
    it { expect(page.javascripts).to be_a(Enumerable) }
    it { expect(page.javascripts).not_to be_empty }
  end

  describe 'images' do
    it { expect(page.images).to respond_to(:+) }
    it { expect(page.images).to be_a(Enumerable) }
    it { expect(page.images).not_to be_empty }
  end
end