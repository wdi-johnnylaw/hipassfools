class ChangeDateToTimeInMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :date, :time
    change_column :messages, :time, :datetime
  end
end
