class BestBuyService

  def initialize
    @_conn = Faraday.new(:url => 'https://api.bestbuy.com/v1/') do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_stores_by_zip_code(zip_code)
    response = conn.get do |req|
      req.url ("stores(area(#{zip_code},25))")
      req.params['apiKey'] = ENV['BEST_BUY_KEY']
      req.params['format'] = 'json'
      req.params['pageSize'] = '15'
      req.params['show'] = 'longName,city,distance,phone,storeType'
    end
    parse(response)
  end

  private

  def conn
    @_conn
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
