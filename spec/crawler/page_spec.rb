require 'spec_helper'
require 'crawler/page'

describe Crawler::Page do
  let(:html)     { File.read(File.expand_path('../../support/index.html', __FILE__)) }
  subject(:page) { described_class.new('http://foo.bar') }
  before         { allow(page).to receive(:html).and_return(html) }
  
  it { expect(page).to     respond_to(:url) }
  it { expect(page).not_to respond_to(:url=) }
  it { expect(page).to     respond_to(:each_link) }
  it { expect(page).to     respond_to(:assets) }
  it { expect(page).to     respond_to(:links) }
  it { expect(page).to     respond_to(:stylesheets) }
  it { expect(page).to     respond_to(:javascripts) }
  it { expect(page).to     respond_to(:images) }

  describe 'url' do
    it { expect(page.url).to be_a(URI) }
  end

  describe 'each_link' do
    context 'when no block is given' do
      it { expect(page.each_link).to be_a(Enumerator) }
    end

    context 'when a block is given' do
      it 'yields each link absolute url' do
        page.each_link do |l|
          expect(l).to start_with('http://foo.bar')
        end
      end
    end
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