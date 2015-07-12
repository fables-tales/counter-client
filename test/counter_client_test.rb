require "minitest/autorun"
$: << "lib/"
require "counter_client"

class CounterClientTest < Minitest::Test
  def setup
    @counter_client = CounterClient.new(http)
    @key            = SecureRandom.hex
  end

  protected

  attr_reader :counter_client, :key, :http

  class IntegratedCounterClientTest < CounterClientTest
    def setup
      @http = LHttp
      super
    end

    def test_get_uninitialized_key
      assert_equal(0, counter_client.get(key))
    end

    def test_get_key_incremented_once
      counter_client.increment(key)
      assert_equal(1, counter_client.get(key))
    end

    def test_get_key_incremented_a_random_number_of_times
      n = (rand * 100).to_i
      n.times { counter_client.increment(key) }
      assert_equal(n, counter_client.get(key))
    end
  end
end
