class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  INTERNAL_DOMAINS = [
    '.osqdu.org',
  ]
end
