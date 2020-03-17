class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 50}
  validates :email, length: {maximum: 255}

  has_one_attached :image

  has_many :items, foreign_key: :user_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  has_many :likes, foreign_key: :user_id, dependent: :destroy
  has_many :like_items, through: :likes, source: :item

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end

end
