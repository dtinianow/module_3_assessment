class Store

attr_reader :full_name,
            :city,
            :distance,
            :phone_number,
            :type,
            :id

  def initialize(store_params)
    @full_name    = store_params[:longName]
    @city         = store_params[:city]
    @distance     = store_params[:distance]
    @phone_number = store_params[:phone]
    @type         = store_params[:storeType]
    @id           = store_params[:storeId]
  end

  def self.service
    BestBuyService.new
  end

  def self.find_all_by_zip_code(zip_code)
    service.get_stores_by_zip_code(zip_code)[:stores].map do |store|
      new(store)
    end
  end

  def self.total_count_by_zip_code(zip_code)
    service.get_stores_by_zip_code(zip_code)[:total]
  end

  def self.find_by_id(id)
    service.get_store_by_id(id)[:stores]
  end
end
