class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first
      t.string :last
      t.integer :num_invited
      t.integer :likelihood
      t.references :guest_category, index: true
      t.integer :rsvp_adults
      t.integer :rsvp_children
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :relationship
      t.string :comments

      t.timestamps
    end
  end
end
