class Item < ApplicationRecord
  validates :user_id, presence:true
  validates :description, presence: true

  has_many_attached :images

  belongs_to :user, optional: true
  has_many :comments, foreign_key: :item_id, dependent: :destroy
  has_many :likes, foreign_key: :item_id, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :item_category
  has_many :categories, through: :item_category


end
