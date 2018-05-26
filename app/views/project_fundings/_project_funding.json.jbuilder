json.extract! project_funding, :id, :project_id, :user_id, :project_promise_id, :amount, :created_at, :updated_at
json.url project_funding_url(project_funding, format: :json)
