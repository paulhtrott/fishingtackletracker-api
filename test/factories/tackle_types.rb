FactoryGirl.define do

  factory :tackle_type, class: TackleType do

    transient do
      tackle_category_name "Lures"
    end

    tackle_category { create :tackle_category, name: tackle_category_name }
    name "Soft Bait Lure"
  end
end
