FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { '000AAA' }
    password_confirmation { password }
    last_name             { 'くどう' }
    first_name            { 'しゅみ' }
    last_name_kana        { 'クドウ' }
    first_name_kana       { 'シュミ' }
    birthday              { '1999-01-01' }
  end
end
