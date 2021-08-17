FactoryBot.define do
  factory :item do
   name {"ppp"} 
   description {"あ"}
   add {"あ"}
   category_id {2}
   sales_status_id {2}
   prefecture_id {2}
   scheduled_delivery_id {2}
   price {300}

   association :user
   association :order

   after(:build) do |item|
    item.image.attach(io: File.open('public/images/テスト画像.png'), filename: 'test_image.png')
  end
    
  end
end
