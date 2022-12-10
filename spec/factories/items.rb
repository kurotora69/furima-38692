FactoryBot.define do
  factory :item do
    association :user
    item_name          { 'test' }
    category_id        { 2 }
    detail_id          { 2 }
    delivery_charge_id { 2 }
    number_day_id      { 2 }
    price              { 300 }
    prefecture_id      { 2 }
    explanation        { '説明' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/ohana_image.png'), filename: 'ohana_image.png')
    end
  end
end

# image              {IMG_20220307_112939.jpg}
