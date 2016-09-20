class Store

attr_reader :full_name,
            :city,
            :distance,
            :phone_number,
            :type

  def initialize(store_params)
    @full_name    = store_params[:longName]
    @city         = store_params[:city]
    @distance     = store_params[:distance]
    @phone_number = store_params[:phone]
    @type         = store_params[:storeType]
  end

end