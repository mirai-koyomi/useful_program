class MillsecConvert < ApplicationRecord

  validates :before_date, presence: true, unless: -> { after_date? && time_diff? }
  validates :after_date, presence: true, unless: -> { before_date? && time_diff? }
  validates :time_diff, presence: true, unless: :time_exist?

  before_save :get_date, unless: :time_exist?
  before_save :get_time_diff, if: :time_exist?

  private
  def time_exist?
    return true if before_date? && after_date?
    false
  end

  def get_time_diff
    self.time_diff = self.after_date.to_i - self.before_date.to_i
  end

  def get_date
    if before_date?
      self.after_date = move_time(self.before_date, time_diff)
    elsif after_date?
      self.before_date = move_time(self.after_date, time_diff)
    end
  end

  def move_time(base_time, elapsed_time)
    if elapsed_time >= 0
      return base_time.since(elapsed_time)
    else
      elapsed_time = elapsed_time * -1
      return base_time.ago(elapsed_time)
    end
  end
end