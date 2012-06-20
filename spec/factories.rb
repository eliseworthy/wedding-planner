FactoryGirl.define do
  factory :wedding do
    name "Wedding Name"
    description "A great zombie"
    user_id 1
  end

  factory :item do
    name "Dress"
    description "The prettiest dress"
    wedding
    price 2999.99
  end
end