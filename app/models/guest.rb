require 'digest/md5'

class Guest < ActiveRecord::Base
  UUID = '27c69370-9740-4b31-94ac-5681df0701a9'

  belongs_to :guest_category

  before_save :set_ext_id

  def set_ext_id
    self.ext_id = Digest::MD5.hexdigest( "#{@id.to_s} || jeff's crazy #{UUID}" )
    puts self.ext_id
  end

  def self.getUUID
    UUID
  end

  def self.find_guest(first: nil, last: nil, city: nil)
    return nil if ((!!first ? 1 : 0) + (!!last ? 1 : 0) + (!!city ? 1 : 0)) < 2

    sql = 'TRUE'
    guest_params = {}

    if ! first.blank?
      sql << ' AND (TRIM(LOWER(first)) = :first_name OR TRIM(LOWER(guest_first)) = :guest_first) '
      guest_params[:first_name] = guest_params[:guest_first] = first.downcase.strip
    end
    if ! last.blank?
      sql << ' AND (TRIM(LOWER(last)) = :last_name OR TRIM(LOWER(guest_last)) = :guest_last) '
      guest_params[:last_name] = guest_params[:guest_last] = last.downcase.strip
    end
    if ! city.blank?
      sql << ' AND TRIM(LOWER(city)) = :city '
      guest_params[:city] = city.downcase.strip
    end

    @guest = Guest.where(sql, guest_params) 
  end

  def rsvp(num_adults, num_children)
    if num_adults && num_adults.to_i
      self.rsvp_adults = num_adults
    else
      self.rsvp_adults = 0
    end
    if num_children && num_children.to_i
      self.rsvp_children = num_children
    else
      self.rsvp_children = 0
    end
    self.save!
  end
end
