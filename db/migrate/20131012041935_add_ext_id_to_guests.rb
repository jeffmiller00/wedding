class AddExtIdToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :ext_id, :string
  end
end
