class ProjectFunding < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :project_promise, optional: true
end
