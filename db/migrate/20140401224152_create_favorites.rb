class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :message, index: true
    end

    add_index :favorites, [:user_id, :message_id], unique: true
  end
end
