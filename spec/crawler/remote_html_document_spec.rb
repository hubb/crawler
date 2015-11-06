require 'spec_helper'
require 'crawler/remote_html_document'

module Crawler
  class TestProxy
    include RemoteHTMLDocument

    attr_reader :url
    def initialize(url)
      @url = URI.parse(url)
    end
  end
end

describe Crawler::TestProxy do
  subject(:proxy) { described_class.new('http://foo.lan') }

  it { expect(proxy).to respond_to(:html) }
  it { expect(proxy).to respond_to(:document) }

  describe 'document' do
    let(:html) { File.read(File.expand_path('../../support/index.html', __FILE__)) }
    
    context 'when using the default html_parser' do
      before { allow(proxy).to receive(:html).and_return(html) }

      it { expect(proxy.document).to be_a(Nokogiri::HTML::Document) }
    end

    context 'when using a custom html_parser' do
      before do
        allow(proxy).to receive(:html).and_return('GoCardless')
        proxy.html_parser = ->(string) { "Hello " + string }
      end

      it { expect(proxy.document).to eq('Hello GoCardless') }
    end
  end

  describe 'html' do
    context 'when unable to read from remote source' do
      it 'uses a friendly error message as html' do
        expect(proxy.html).to include(
          'Unable to fetch http://foo.lan, reason getaddrinfo: nodename nor ' \
          'servname provided, or not known')
      end
    end
  end
end