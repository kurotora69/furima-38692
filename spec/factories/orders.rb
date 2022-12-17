FactoryBot.define do
  factory :order do
    post_code      { '123-4567' }
    prefecture_id  { 2 }
    city           { '浜市' }
    address        { '1-1' }
    tel            { '08012345678' }
    building       { 'コーポ' }
    user_id        { 1 }
    item_id        { 1 }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
