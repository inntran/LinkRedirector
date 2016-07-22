FactoryGirl.define do
  factory :link do
    slug "short_link"
    destination "http://internal.osqdu.org/"
    click_count 1
    last_click_at "2016-07-20 22:17:23"
  end
end
