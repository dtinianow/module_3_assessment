require 'rails_helper'

RSpec.feature "User can search for stores" do
  scenario "they see 15 stores within 25 miles of the zip_code 80202" do
    VCR.use_cassette('best_buy_service_get_stores_by_zip_code') do

      visit '/'
      within('.search-field') do
        fill_in 'zip_code', with: 80202
        click_on 'Search'
      end

      expect(current_path).to eq '/search'
      expect(page).to have_content '17 Total Stores'

      within('.results') do
        expect(page).to have_content "Name"
        expect(page).to have_content "City"
        expect(page).to have_content "Distance"
        expect(page).to have_content "Phone Number"
        expect(page).to have_content "Store Type"
        expect(page).to have_content "Best Buy Mobile - Cherry Creek Shopping Center"
        expect(page).to have_content "Denver"
        expect(page).to have_content "3.25"
        expect(page).to have_content "303-270-9189"
        expect(page).to have_content "Mobile"
        expect(page).to have_selector('.store', count: 15)
      end
    end
  end
end
