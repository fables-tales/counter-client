require "counter_client"
require "securerandom"

describe CounterClient do
  subject(:counter_client) { CounterClient.new }

  describe "a key that has no counts" do
    let(:key) { SecureRandom.hex }

    it "initially returns a count of zero" do
      expect(counter_client.get(key)).to eq(0)
    end

    it "returns a count of 1 after being incremented once" do
      counter_client.increment(key)
      expect(counter_client.get(key)).to eq(1)
    end

    it "returns the correct count after being incremented a random number of times" do
      n = (rand * 100).to_i
      n.times { counter_client.increment(key) }
      expect(counter_client.get(key)).to eq(n)
    end
  end
end
