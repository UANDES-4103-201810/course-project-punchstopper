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

  def date_cannot_be_in_the_past
    if delivery_date.present? && delivery_date < Date.today
      errors.add(:delivery_date, "Can not be in the past")
    end
  end

end
