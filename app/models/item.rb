class Item < ApplicationRecord
  validates :user_id, presence:true
  validates :description, presence: true

  has_many_attached :images

  belongs_to :user, optional: true
  has_many :comments, foreign_key: "item_id", dependent: :destroy

end
