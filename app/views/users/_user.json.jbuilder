json.extract! user, :id, :first_name, :last_name, :email, :description, :born_date, :city_id, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
