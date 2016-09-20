require 'rails_helper'

RSpec.feature "User can see a single store" do
  xscenario "they see information about the store" do
    VCR.use_cassette('best_buy_service_get_store_by_id') do

      visit '/'

      within('.search-field') do
        fill_in 'zip_code', with: 80202
        click_on 'Search'
      end

      expect(current_path).to eq '/search'

      within('.results') do
        click_on "Best Buy Mobile - Cherry Creek Shopping Center"
      end

      within('.single-store-results') do
        expect(page).to have_content "Name"
        expect(page).to have_content "Best Buy Mobile - Cherry Creek Shopping Center"
        expect(page).to have_content "Store Type"
        expect(page).to have_content "Address"
        expect(page).to have_content "3000 East First Ave"
        expect(page).to have_content "City"
        expect(page).to have_content "Denver"
        expect(page).to have_content "State"
        expect(page).to have_content "CO"
        expect(page).to have_content "Zip Code"
        expect(page).to have_content "80206"
        expect(page).to have_content "Hours"
        expect(page).to have_content "Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-9; Sat: 10-9; Sun: 11-6"
      end
    end
  end
end

# https://api.bestbuy.com/v1/stores(storeId=2740)?format=json&apiKey=ENV['BEST_BUY_KEY']

# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
