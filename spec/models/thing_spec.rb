require 'rails_helper'

RSpec.describe Thing, type: :model do
  let(:thing) { Thing.create(name: "asdfasdfasdf") }

  context "when thing is sleeping" do
    context "when sleeping_guard is true" do
      it "stays asleep" do
        expect(thing).to receive(:crank!).and_call_original
        expect(thing).to receive(:sleeping_guard).and_return true
        expect(thing).to receive(:process_sleeping).and_call_original
        thing.crank!
        expect(thing).to be_sleeping
      end
    end
  end

end
