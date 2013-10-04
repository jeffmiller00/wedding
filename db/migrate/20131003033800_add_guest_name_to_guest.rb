class AddGuestNameToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :guest_name, :string
  end
end
