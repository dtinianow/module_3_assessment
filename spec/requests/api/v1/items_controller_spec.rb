require 'rails_helper'

describe "Items" do
  fixtures :items

  it 'can return JSON data on all items' do
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

  it 'can return JSON data on a specific item' do
    get '/api/v1/items/2'

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.class).to eq(Hash)
    expect(item['id']).to eq(2)
    expect(item['name']).to eq('Robotron')
    expect(item['description']).to eq('Boop boop beep')
  end

  it 'can delete an item' do
    item = items(:one)

    delete "/api/v1/items/#{item.id}"

    expect(response.status).to eq 204
  end
end
