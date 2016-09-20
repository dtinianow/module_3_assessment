class SearchController < ApplicationController

  def index
    @stores = Store.find_all_by_zip_code(params[:zip_code])
    @store_count = Store.total_count_by_zip_code(params[:zip_code])
  end
end
