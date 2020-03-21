class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable,
  :omniauthable, omniauth_providers: [:facebook]


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

  def self.from_omniauth(auth)
    where(uid: auth.uid).first
  end

    def self.new_with_session(_, session)
      super.tap do |user|
        if (data = session['devise.omniauth_data'])
          user.email = data['email'] if user.email.blank?
          user.provider = data['provider'] if data['provider'] && user.provider.blank?
          user.uid = data['uid'] if data['uid'] && user.uid.blank?
          user.skip_confirmation!
        end
      end
    end

  end
