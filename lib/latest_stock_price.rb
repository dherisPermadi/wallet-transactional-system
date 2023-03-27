class LatestStockPrice
  require 'uri'
  require 'net/http'
  require 'openssl'

  def initialize(indices, identifier)
    @indices = indices
    @identifier = identifier
  end

  def price
    endpoint = "https://#{ENV['RAPID_API_HOST']}/price?Indices=#{indices}"
    endpoint = "#{endpoint}&Identifier=#{identifier}"
    request(endpoint)
  end

  # The endpoint and parameters of price and prices is the same on latest stock api, I still split the method in case of any changes in the future
  def prices
    endpoint = "https://#{ENV['RAPID_API_HOST']}/price?Indices=#{indices}"
    endpoint = "#{endpoint}&Identifier=#{identifier}"
    request(endpoint)
  end

  def prices_all
    request("https://#{ENV['RAPID_API_HOST']}/any")
  end

  private

  def request(full_url)
    url = URI(full_url)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV['RAPID_API_KEY']
    request["X-RapidAPI-Host"] = ENV['RAPID_API_HOST']

    response = http.request(request)
    JSON.parse(response.read_body)
  end
end
