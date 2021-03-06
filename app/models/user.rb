class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :password
    validates :family_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :family_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_date
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Password Include both letters and numbers'
end
