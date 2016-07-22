class Link < ApplicationRecord
  validates_with SchemeValidator

  def click
    self.click_count += 1
    self.last_click_at = Time.now
  end

  def external?
    uri = URI.parse(self.destination)
    not uri.host.end_with?(*INTERNAL_DOMAINS)
  end

  def maturity
    if self.click_count < 1000
      return 'fresh'
    else
      return 'mature'
    end
  end
end
