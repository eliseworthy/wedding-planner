FactoryGirl.define do
  factory :wedding do
    name "Wedding Name"
    description "A great zombie"
    user_id 1
    factory :birds_wedding do
      name "Birds Wedding"
      user_id 2
    end
  end

  factory :category do
    name "Gown"
  end

  factory :item do
    name "Dress"
    description "The prettiest dress"
    wedding
    category
    price 2999.99
  end
end