require 'rails_helper'

describe Store do

  it "returns a list of stores by zip code" do
    VCR.use_cassette("best_buy_service_get_stores_by_zip_code") do
      zip_code = 80202
      stores = Store.find_all_by_zip_code(zip_code)
      store = stores.first

      expect(stores.count).to eq 15
      expect(store).to respond_to :full_name
      expect(store).to respond_to :city
      expect(store).to respond_to :distance
      expect(store).to respond_to :phone_number
      expect(store).to respond_to :type
      expect(store.full_name).to eq 'Best Buy Mobile - Cherry Creek Shopping Center'
      expect(store.city).to eq 'Denver'
      expect(store.distance).to eq 3.25
      expect(store.phone_number).to eq '303-270-9189'
      expect(store.type).to eq 'Mobile'
    end
  end

  it "returns a count of stores by zip code" do
    VCR.use_cassette("best_buy_service_get_stores_by_zip_code") do
      zip_code = 80202
      total = Store.total_count_by_zip_code(zip_code)

      expect(total).to eq 17
    end
  end
end
