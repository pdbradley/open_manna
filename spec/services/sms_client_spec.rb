require 'rails_helper'

describe SMSClient do
  let(:nexmo_client) { double }
  it "enqueues a text verse worker" do
    from = ENV["NEXMO_PHONE"]
    to = "15555555555"
    text = "helloworld"

    expect(Nexmo::Client).to receive(:new).and_return(nexmo_client)
    expect(nexmo_client).to receive(:send_message).with(from: from, to: to, text: text)

    client = SMSClient.new
    client.send_message(to: to, text: text)
  end
end
