require 'rails_helper'

RSpec.describe Thing, type: :model do
  let(:thing) { Thing.create(name: "asdfasdfasdf") }

  it "runs" do
    expect(thing).to receive(:run!).and_call_original
    expect(thing).to receive(:running_guard).and_return true
    expect(thing).to receive(:process_running).and_call_original
    thing.run!
    expect(thing).to be_running
  end
  it "sleeps" do
    expect(thing).to receive(:run!).and_call_original
    expect(thing).to receive(:running_guard).and_return false
    expect(thing).not_to receive(:process_running).and_call_original
    thing.run!
    expect(thing).to be_sleeping
  end
end
