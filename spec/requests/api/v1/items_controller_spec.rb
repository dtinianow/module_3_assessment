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

  it 'can create an item' do
    item_params = { name: "Brobot",
                    description: "The broiest robot",
                    image_url: 'http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200'
    }

    post "/api/v1/items", item: item_params
    item = Item.last

    expect(response.status).to eq 201
    expect(item['name']).to eq 'Brobot'
    expect(item['description']).to eq 'The broiest robot'
    expect(item['image_url']).to eq 'http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200'
  end


  it 'can delete an item' do
    item = items(:one)

    delete "/api/v1/items/#{item.id}"

    expect(response.status).to eq 204
  end
end
