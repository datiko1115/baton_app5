class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true
  validates :last_kana, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'
  
  FIRST_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
  validates_format_of :first_name, with: FIRST_NAME_REGEX, message: 'is invalid. Input full-width characters'

  LAST_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
  validates_format_of :last_name, with: LAST_NAME_REGEX, message: 'is invalid. Input full-width characters'

  FIRST_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :first_kana, with: FIRST_KANA_REGEX, message: 'is invalid. Input full-width katakana characters'

  LAST_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :last_kana, with: LAST_KANA_REGEX, message: 'is invalid. Input full-width katakana characters'
end
