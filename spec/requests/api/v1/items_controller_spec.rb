require 'rails_helper'

describe "Items" do
  fixtures :items

  it 'returns JSON data on all items' do
    get '/api/v1/items'

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.length).to eq(2)
    expect(items.class).to eq(Array)
    expect(item.class).to eq(Hash)
    expect(item['id']).to eq(1)
    expect(item['name']).to eq("Robot")
    expect(item['description']).to eq("Beep boop")
  end
end
