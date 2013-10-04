json.array!(@guests) do |guest|
  json.extract! guest, :first, :last, :guest_name, :num_invited, :likelihood, :guest_category_id, :rsvp_adults, :rsvp_children, :address, :city, :state, :zip, :relationship, :comments
  json.url guest_url(guest, format: :json)
end
