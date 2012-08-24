require 'spec_helper'

describe Egg, 'configuration' do
  subject { Egg } # not Egg.new

  describe 'setting the URL' do
    let(:url) { 'http://egg.example.com/events' }
    before { subject.url = url }

    its(:url)         { should eq(URI(url)) }
    its('url.scheme') { should eq('http') }
    its('url.host')   { should eq('egg.example.com') }
    its('url.port')   { should eq(80) }
    its('url.path')   { should eq('/events') }
  end

  describe 'setting the API key' do
    let(:api_key) { '1234567890abcdef' }
    before { subject.api_key = api_key }
    its(:api_key) { should eq(api_key) }
  end
end
