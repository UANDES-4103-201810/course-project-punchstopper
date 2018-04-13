class Project < ApplicationRecord
  belongs_to :user
  has_many :project_medium, dependent: :destroy
  has_many :project_promises, dependent: :destroy
  has_many :project_fundings, dependent: :destroy
end
