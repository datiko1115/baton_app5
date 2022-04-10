class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :buyer_orders
  has_many :virtual_fitting
  has_many_attached :images
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer_or_customer

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true
  validates :last_kana, presence: true
  validates :birthday, presence: true
  validates :buyer_or_customer_id, presence: true
  validates :user_comment, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers', on: :create
  
  NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
  validates_format_of :first_name, with: NAME_REGEX, message: 'is invalid. Input full-width characters'
  validates_format_of :last_name, with: NAME_REGEX, message: 'is invalid. Input full-width characters'

  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :first_kana, with: KANA_REGEX, message: 'is invalid. Input full-width katakana characters'
  validates_format_of :last_kana, with: KANA_REGEX, message: 'is invalid. Input full-width katakana characters'
end
