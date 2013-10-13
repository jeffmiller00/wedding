require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @guest = Guest.new
    @guest.first = "First"
    @guest.last  = "Last"
    @guest.city  = "City"
    @guest.save!
  end

  def test_that_find_guest_works_with_first_last_city
    assert_equal @guest, Guest.find_guest(first: "First", last: "Last", city: "City").first
  end

  def test_that_find_guest_works_with_first_last
    assert_equal @guest, Guest.find_guest(first: "First", last: "Last").first
  end

  def test_that_find_guest_works_with_first_city
    assert_equal @guest, Guest.find_guest(first: "First", city: "City").first
  end

  def test_that_find_guest_works_with_last_city
    assert_equal @guest, Guest.find_guest(last: "Last", city: "City").first
  end

  def test_find_guest_fails_if_1_of_3
    person = { first: "First", last: "Last", city: "City" }
    assert_equal nil, Guest.find_guest(first: "First")
    assert_equal nil, Guest.find_guest(last: "Last")
    assert_equal nil, Guest.find_guest(city: "City")
  end  
end
