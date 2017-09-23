FactoryGirl.define do

  factory :tackle, class: Tackle do

    transient do
      tackle_type_name "Spoon"
    end

    user
    tackle_type { create :tackle_type, name: tackle_type_name }
    name "JR Thunderstick"
    description "JR Thunderstick Madflash series top water lure. Swim depth: 1' to 5'."
    size 3.5
    quantity 5
    color "Glow in the dark - Tequila"
    model_number "JM583"
    shape "fish"
    length 3.5
    length_unit "inches"
    weight 6
    weight_unit "ounces"
    brand "Storm"
    quantity_wanted 6
    price 5.49
  end
end
