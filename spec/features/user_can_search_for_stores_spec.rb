require 'rails_helper'

RSpec.feature "User can search for stores" do
  scenario "they see 15 stores within 25 miles of the zipcode 80202" do
    VCR.use_cassette('store_service_get_stores_by_zipcode') do

      visit '/'
      within('.search-field') do
        fill_in 'zipcode', with: 80202
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

# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
#
# The name will be a link in the next story:
#
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
