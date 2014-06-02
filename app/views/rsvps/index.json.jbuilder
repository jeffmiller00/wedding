json.array!(@rsvps) do |rsvp|
  json.extract! rsvp, :id, :invited_guest_name, :plus_one?, :plus_one_name, :meal
  json.url rsvp_url(rsvp, format: :json)
end
