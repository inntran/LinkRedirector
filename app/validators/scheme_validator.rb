class SchemeValidator < ActiveModel::Validator
  GOOD_URL_SCHEME = ['http', 'https']

  def validate(link)
    uri = URI.parse(link.destination)
    if not GOOD_URL_SCHEME.include?(uri.scheme)
      link.errors.add(:destination, "can only be HTTP and HTTPS URLs are supported")
    end
  end
end