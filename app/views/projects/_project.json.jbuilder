json.extract! project, :id, :user_id, :title, :description, :goal_amount, :finish_date, :delivery_date, :created_at, :updated_at
json.url project_url(project, format: :json)
