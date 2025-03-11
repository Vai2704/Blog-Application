class Post < ApplicationRecord
  has_many :comments

  scope :live, -> { where(status: true)}

  def delete_post
    update(status: false)
  end
end
