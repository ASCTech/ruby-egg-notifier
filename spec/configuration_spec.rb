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

  describe 'setting the Service' do
    let(:service) { 'My Cool App' }
    before { subject.service = service }
    its(:service) { should eq(service) }
  end
end
