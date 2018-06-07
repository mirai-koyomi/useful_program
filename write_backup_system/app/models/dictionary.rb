class Dictionary < ApplicationRecord
  before_validation :check_title, :check_status, :check_publish
  validates :title, presence: true, length: { maximum: 100 }
  validates :contents, presence: true
  validates :status, inclusion: { in: ['draft', 'released'] }
  validates :publish, inclusion: { in: [true, false] }

  private
  def check_title
    unless ( title? )
      self.title = '無題のドキュメント' + Time.now.strftime('%Y%m%d%H%M%S')
    end
  end

  def check_status
    unless ( status? )
      self.status = 'draft'
    end
  end

  def check_publish
    unless ( self.status != 'draft' || self.publish.nil? )
      self.publish = false
    end
  end
end
