FactoryBot.define do
  factory :item do
    name {"商品名"}
    explain {"商品の説明文"}
    price {8888}
    category_id {2}
    condition_id {2}
    payment_id {2}
    prefecture_id {2}
    day_id {2}

    association :user  

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
