require 'spec_helper'

describe Egg::Notifier do

  describe '#new' do
    describe 'the default timestamp is now' do
      let(:timestamp) { Time.at(100000000) }
      subject { Egg::Notifier.new('the-event-name') }
      before { Time.should_receive(:now).and_return(timestamp) }
      its(:timestamp) { should eq(timestamp.utc.iso8601) }
    end
  end

  describe '#execute!' do
    let(:api_key) { '1234567890abcdef' }
    subject { Egg::Notifier.new('the-event-name', '2012-08-23T14:25:00Z') }

    it 'should raise an exception when the API key is not defined' do
      Egg.url = 'http://egg.example.com/events'
      lambda { subject.execute! }.should raise_error(Egg::APIKeyNotDefined)
    end

    it 'should raise an exception when the url is not defined' do
      Egg.api_key = api_key
      lambda { subject.execute! }.should raise_error(Egg::UrlNotDefined)
    end

    context 'with api_key and url defined' do
      let(:http)    { Egg::Notifier.send(:http) }
      let(:json)    { '{"name":"the-event-name","timestamp":"2012-08-23T14:25:00Z"}' }
      let(:headers) { {'Content-type' => 'application/json', 'X-API-Key' => api_key} }

      before do
        Egg.api_key = api_key
        Egg.url = 'http://egg.example.com/events'
        http.should_receive(:post).with('/events', json, headers)
      end

      it 'should work right' do
        subject.execute!
      end
    end
  end

  describe '.http' do
    let(:url)  { URI('http://egg.example.com/events') }
    before do
      Egg::Notifier.instance_variable_set('@http', nil)
      Egg.url = url
      http = Net::HTTP.new(url.host, url.port)
      Net::HTTP.should_receive(:new).once.and_return(http)
    end
    it 'should only instantiate the HTTP object once' do
      3.times { Egg::Notifier.send(:http) }
    end
  end
end
