class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  scope :live, -> { where(status: true)}

  def delete_post
    update(status: false)
  end
end

