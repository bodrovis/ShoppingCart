require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence :uid do |i|
      "#{i}" * 7
    end

    name 'testuser'

    nickname 'testuser'
  end

  factory :product do
    sequence :title do |i|
      "Product ##{i}"
    end
  end
end