class ProjectPromise < ApplicationRecord
  belongs_to :project
  has_many :project_fundings, dependent: :destroy
  validates :project,:cost, presence: true
  validates :cost, numericality: {greater_than: 0}
end
