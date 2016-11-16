FactoryGirl.define do
  factory :evaluation do
    star_date Date.yesterday
    evaluation_time Time.current.beginning_of_hour
    time_zone "Pacific Time (US & Canada)"
    assessment FFaker::Lorem.paragraph
    rating "acceptable"
    crew_member
  end
end
