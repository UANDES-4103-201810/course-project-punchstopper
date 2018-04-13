class User < ApplicationRecord

  has_many :projects, dependent: :destroy
  has_many :user_wishlists, dependent: :destroy

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: {minimum: 4}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
