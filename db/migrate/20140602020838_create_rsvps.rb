class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :invited_guest_name
      t.boolean :plus_one
      t.string :plus_one_name
      t.string :meal

      t.timestamps
    end
  end
end
