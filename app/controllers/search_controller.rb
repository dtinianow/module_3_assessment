class SearchController < ApplicationController

  def index
    @stores = Store.find_all
  end

end
