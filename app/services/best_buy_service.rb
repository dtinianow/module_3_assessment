class BestBuyService

  def initialize
    @_conn = Faraday.new(:url => 'https://api.bestbuy.com/v1/')
    faraday.request :url_encoded
    faraday.response :logger
    faraday.adapter Faraday.default_adapter
  end

  def get_stores(zipcode)
    response = conn.get("stores(area(#{params[:zipcode]},25))?format=json&apiKey=#{ENV['BEST_BUY_KEY']}&pageSize=15&show=longName,city,distance,phone,storeType") do |req|

  end

private

  def conn
    @_conn
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
