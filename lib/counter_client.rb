require "lhttp"

class CounterClient
  def initialize(http)
    @http = http
  end

  def get(key)
    http_client.get("#{service_base_url}#{key}").to_s.to_i
  end

  def increment(key)
    http_client.post("#{service_base_url}#{key}")
  end

  private

  def http_client
    @http
  end

  def service_base_url
    "http://localhost:4567/"
  end
end
