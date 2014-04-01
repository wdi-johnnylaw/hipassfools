class AddColumnsToInvites < ActiveRecord::Migration
  def up
    remove_column :invites, :name
    add_column :invites, :first_name, :string
    add_column :invites, :last_name, :string
    add_column :invites, :sent_at, :datetime
  end

  def down
    remove_column :invites, :sent_at
    remove_column :invites, :last_name
    remove_column :invites, :first_name
    add_column :invites, :name, :string
  end
end
