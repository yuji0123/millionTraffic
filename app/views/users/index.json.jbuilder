json.array!(@users) do |user|
  json.extract! user, :id, :userId, :userCompany, :userDiscountRate
  json.url user_url(user, format: :json)
end
