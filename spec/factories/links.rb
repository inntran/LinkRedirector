FactoryGirl.define do
  factory :link do
    slug "short_link"
    destination "http://internal.osqdu.org/"

    factory :invalid_scheme_link do
      slug "fb"
      destination "smtp://smtp.outlook.com/"
    end

    factory :facebook_link do
      destination "https://facebook.com"
    end
  end
end
