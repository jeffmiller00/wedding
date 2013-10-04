json.array!(@guest_categories) do |guest_category|
  json.extract! guest_category, :name, :default_likelihood
  json.url guest_category_url(guest_category, format: :json)
end
