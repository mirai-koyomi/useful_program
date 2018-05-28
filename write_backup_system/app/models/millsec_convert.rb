class MillsecConvert < ApplicationRecord
  validates :before_time, :after_time, presence: true
  validate :get_difference

  private
  def get_difference
    if (self.after_time.present? && self.before_time.present?)
      p self.after_time
      p self.after_time.to_time.to_i
      self.difference = self.after_time.to_time.to_i - self.before_time.to_time.to_i
      self.millsec = self.difference * 1000.0
    else
      self.difference = nil
      self.millsec = nil
    end
  end
end
