class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :project_medium, dependent: :destroy
  has_many :project_fundings, dependent: :destroy
  has_many :project_promises, dependent: :destroy
  has_many :user_wishlists, dependent: :destroy
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/dummy.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates :user,:title,:goal_amount,:finish_date,:delivery_date, presence: true
  validates :goal_amount, numericality: {greater_than: 0}
  validate :date_cannot_be_in_the_past
  validate :cant_deliver_before_finish

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
