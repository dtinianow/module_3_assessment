require 'rails_helper'

describe BestBuyService do
  context '#get_stores_by_zip_code' do
    it 'returns a list of stores based on zip code' do
      VCR.use_cassette('best_buy_service_get_stores_by_zip_code') do
        zip_code = 80202

        raw_stores = BestBuyService.new.get_stores_by_zip_code(zip_code)
        total     = raw_stores[:total]
        stores    = raw_stores[:stores]
        store     = stores.first

        expect(total).to eq 17
        expect(stores.count).to eq 15
        expect(store).to respond_to :longName
        expect(store).to respond_to :city
        expect(store).to respond_to :distance
        expect(store).to respond_to :phone
        expect(store).to respond_to :storeType
        expect(store[:longName].class).to eq(String)
        expect(store[:city].class).to eq(String)
        expect(store[:distance].class).to eq(Float)
        expect(store[:phone].class).to eq(String)
        expect(store[:storeType].class).to eq(String)
      end
    end
  end
end
