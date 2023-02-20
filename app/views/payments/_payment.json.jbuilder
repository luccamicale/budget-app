json.extract! payment, :id, :author_id, :name, :amount, :user_id, :group_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
