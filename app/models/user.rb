class User < ApplicationRecord

  has_many :projects, dependent: :destroy

  validates :Username, :Email, :Password, presence: true
  validates :Username, :Email, uniqueness: true
  validates :Password, length: {minimum: 4}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
