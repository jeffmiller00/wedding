class AddChildrenInvitesToGuests < ActiveRecord::Migration
  def change
    rename_column :guests, :num_invited, :invited_adults
    add_column :guests, :invited_children, :integer
  end
end
