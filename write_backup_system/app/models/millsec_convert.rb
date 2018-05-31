class MillsecConvert < ApplicationRecord

  validates :before_date, presence: true, unless: -> { :after_date? || :time_diff? }
  validates :after_date, presence: true, unless: -> { :before_date? || :time_diff? }
  validates :time_diff, presence: true, unless: -> { :before_date? || :after_date? }

  with_options unless: -> { :before_date? || :after_date? } do
    after_validation :get_date
  end
  with_options unless: :time_diff? do
    after_validation :get_time_diff
  end

  def before_date?
    return false if self.before_date.nil?
    true
  end

  def after_date?
    return false if self.after_date.nil?
    true
  end

  def time_diff?
    return false if self.time_diff.nil?
    true
  end

  private
  def get_time_diff
    self.time_diff = self.after_date.to_i - self.before_date.to_i
  end
  def get_date
    if before_date?
      # self.after_date = self.before_date.since(time_diff)
      self.after_date = Time.now
    else after_date?
      self.before_date = self.after_date.ago(time_diff)
    end
  end
end