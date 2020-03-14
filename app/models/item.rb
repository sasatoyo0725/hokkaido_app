class Item < ApplicationRecord
  validates :user_id, presence:true
  validates :description, presence: true

  has_many_attached :images

  belongs_to :user

end
