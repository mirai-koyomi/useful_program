class MillsecConvert < ApplicationRecord
  validates :before_time, presence: true
  validates :after_time, presence: true
  validates :difference, presence: true
  validates :millsec, presence: true
end
