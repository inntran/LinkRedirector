FactoryGirl.define do
  factory :link do
    slug "short_link"
    destination "scheme://server.domain.name/resource/directory/file"
    click_count 1
    last_click_at "2016-07-20 22:17:23"
  end
end
