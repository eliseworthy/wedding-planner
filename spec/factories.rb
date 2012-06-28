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
    description "The prettiest dress"
    photo_url "http://3.bp.blogspot.com/_MFk42OQg7C4/SLlb8vEBmEI/AAAAAAAAAAM/wL1aaUa-f4Y/s400/white_bridal_gown.jpg"
    wedding
  end
end