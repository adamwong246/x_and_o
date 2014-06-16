# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    x_user_id 1
    o_user_id 1
    board "MyString"
  end
end
