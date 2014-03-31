class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :user, index: true
      t.references :tag, index: true
      t.references :message, index: true

      t.timestamps
    end

    add_index :taggings, [:tag_id, :message_id], unique: true
  end
end
