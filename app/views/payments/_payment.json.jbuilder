json.extract! payment, :id, :userId, :amount, :date, :status, :created_at, :updated_at
json.url payment_url(payment, format: :json)
