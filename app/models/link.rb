class Link < ApplicationRecord
  def click
    self.click_count += 1
    self.last_click_at = Time.now
  end
end
