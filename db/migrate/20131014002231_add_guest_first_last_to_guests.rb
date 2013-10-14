class AddGuestFirstLastToGuests < ActiveRecord::Migration
  def change
    rename_column :guests, :guest_name, :guest_first
    add_column :guests, :guest_last, :string
  end
end
