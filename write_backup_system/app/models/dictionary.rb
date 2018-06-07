class Dictionary < ApplicationRecord
  before_validation :check_title, :check_status, :check_publish
  validates :status, inclusion: { in: ['draft', 'released'] }
  validates :publish, inclusion: { in: [true, false] }

  private
  def check_title
    unless ( title? )
      self.title = '無題のドキュメント'
    end
  end

  def check_status
    unless ( status? )
      self.status = 'draft'
    end
  end

  def check_publish
    if ( self.status === 'draft' )
      self.publish = false
    elsif ( self.publish.nil? )
      self.publish = false
    end
  end
end
