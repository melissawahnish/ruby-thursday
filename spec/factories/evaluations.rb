FactoryGirl.define do
  factory :evaluation do
    star_date Date.yesterday
    assessment FFaker::Lorem.paragraph
    rating "acceptable"
    crew_member nil
  end
end
