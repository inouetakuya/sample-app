FactoryGirl.define do
  factory :user do
    sequence(:name){ |n| "Person#{n}" }
    sequence(:email){ |n| "person_#{n}@example.com" }
    password 'foobar'
    password_confirmation 'foobar'
  end

  #factory :user do
  #  name 'INOUE Takuya'
  #  email 'inouetakuya5@gmail.com'
  #  password 'foobar'
  #  password_confirmation 'foobar'
  #end
end
