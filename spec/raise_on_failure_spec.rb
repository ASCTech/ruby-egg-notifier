require 'spec_helper'

describe Egg::Notifier, 'raise an exception on HTTP failure' do
  subject { Egg::Notifier.new('some-event') }

  let(:url) { 'http://egg.example.com/events' }

  before do
    Egg.url = url
    Egg.service = 'FailingService'
    FakeWeb.register_uri(:post, url, :status => 406, :body => 'Rejected')
  end

  context 'raise_on_failure set to true' do
    before { Egg.raise_on_failure = true }
    specify do
      lambda { subject.execute! }.should raise_error(Egg::Notifier::HTTPFailure)
    end

    it 'should include the code and body in the Error message' do
      begin
        subject.execute!
      rescue Egg::Notifier::HTTPFailure => e
        e.message.should eq("406: Rejected")
      end
    end
  end

  context 'raise_on_failure set to false' do
    before { Egg.raise_on_failure = false }
    specify do
      lambda { subject.execute! }.should_not raise_error(Egg::Notifier::HTTPFailure)
    end
  end

end
