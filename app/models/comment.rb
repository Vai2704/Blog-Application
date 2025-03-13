class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :live, -> { where(status: true) }
  
  def delete_comment
    update(status: false)
  end
end
