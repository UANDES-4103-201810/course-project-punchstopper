class ProjectPromise < ApplicationRecord
  belongs_to :project
  validates :project,:cost, presence: true
  validates :cost, numericality: {greater_than: 0}
end
