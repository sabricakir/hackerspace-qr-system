class ChangeIntegerLimitInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :phone, :integer, limit: 10
  end
end
