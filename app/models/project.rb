class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :project_medium, dependent: :destroy
  has_many :project_fundings, dependent: :destroy
  has_many :project_promises, dependent: :destroy
  has_many :user_wishlists, dependent: :destroy

  validates :user,:title,:goal_amount,:finish_date,:delivery_date, presence: true
  validates :goal_amount, numericality: {greater_than: 0}
  validate :date_cannot_be_in_the_past
  validate :cant_deliver_before_finish

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "200x150", thumb: "100x100" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def date_cannot_be_in_the_past
    if finish_date.present? && finish_date < Date.today
      errors.add(:finish_date, "Can not be in the past")
    end
  end
  def cant_deliver_before_finish
    if delivery_date < finish_date
      errors.add(:delivery_date, "Can not deliver before finish")
    end
  end

end
