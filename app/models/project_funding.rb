class ProjectFunding < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :project_promise, optional: true
  validates :user, :project, :amount, presence: true
  validates :amount, numericality: {greater_than: 0}

end
