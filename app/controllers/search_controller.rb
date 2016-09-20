class SearchController < ApplicationController

  def index
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:zip_code]},25))?format=json&apiKey=#{ENV['BEST_BUY_KEY']}&pageSize=15&show=longName,city,distance,phone,storeType")
    # raw_stores = JSON.parse(response.body, symbolize_names: true)
    # stores = raw_stores[:stores]
    # @count = raw_stores[:total]
    # @stores = stores.map do |store|
    #   Store.new(store)
    # end
    @stores = Store.find_all_by_zip_code(params[:zip_code])
    @store_count = Store.total_count_by_zip_code(params[:zip_code])
  end

end
