class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :author
      t.date :date
      t.integer :week
      t.text :body
    end
  end
end
