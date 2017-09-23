FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) {|n| "#{n}@example.com" }
    encrypted_password "p4ul"
    name "Paul"
    address_one "21 Jump Street"
    city "New York"
    state "New York"
    country "Bermuda"
    zipcode "WK12"
  end
end
