FactoryBot.define do
  factory :order_address do
    post_code              { '123-4567' }
    prefecture_id          { 2 }
    city                   { '東京都' }
    address                { '青山1‐1‐1' }
    building               { 'マンション315' }
    phone                  { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
