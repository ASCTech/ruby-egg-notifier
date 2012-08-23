require 'spec_helper'

describe Egg, '#notify' do
  subject { Egg } # not Egg.new

  let(:event_name) { 'EventName' }
  let(:notifier)   { stub(Egg::Notifier) }

  before do
    Egg::Notifier.should_receive(:new).with(*notification_args).and_return(notifier)
    notifier.should_receive(:execute!).and_return(:response)
  end

  context 'not specifying a timestamp' do
    let(:notification_args) { [event_name] }

    it 'should return the response from Egg::Notifier#execute!' do
      subject.notify(*notification_args).should eq(:response)
    end
  end

  context 'specifying the timestamp' do
    let(:timestamp) { Time.now - 3600 }
    let(:notification_args) { [event_name, timestamp] }

    it 'should return the same response' do
      subject.notify(*notification_args).should eq(:response)
    end
  end
end
