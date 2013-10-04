class CreateGuestCategories < ActiveRecord::Migration
  def change
    create_table :guest_categories do |t|
      t.string :name
      t.integer :default_likelihood

      t.timestamps
    end
  end
end
