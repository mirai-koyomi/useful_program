class MillsecConvert < ApplicationRecord

  with_options unless: -> { :before_time? || :after_time? } do
    validates :differense, presence: true
    after_validation :get_time
  end
  with_options unless: :defferense? do
    validates :before_time, :after_time, presence: true
  end

  private
  def get_time
    if before_time?
      # 計算
    else after_time?
      # 計算
    end
  end
end