class Dictionary < ApplicationRecord
  before_validation :set_default_title, :set_default_status, :set_default_publish
  validates :title, presence: true, length: { :maximum => 100 }
  validates :contents, presence: true
  validates :status, inclusion: { :in => ['draft', 'released'] }
  validates :publish, inclusion: { :in => [true, false] }
  validate :can_not_published_with_title_default, if: :is_released?

  def is_released?
    return true if self.status === 'released'
    false
  end
  def is_draft?
    return true if self.status === 'draft'
    false
  end

  private
  def can_not_published_with_title_default
    if ( self.title.match(/無題のドキュメント\d+/) || self.title.blank? )
      errors.add(:title, ": 初期値のタイトルでは公開できません")
    end
  end

  def set_default_title
    unless ( title? )
      self.title = '無題のドキュメント' + Time.now.strftime('%Y%m%d%H%M%S')
    end
  end

  def set_default_status
    unless ( status? )
      self.status = 'draft'
    end
  end

  def set_default_publish
    if ( self.status == 'draft' || self.present? )
      self.publish = false
    end
  end
end
