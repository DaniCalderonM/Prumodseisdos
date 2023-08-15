class AddDetailsToPsusers < ActiveRecord::Migration[7.0]
  def change
    add_column :psusers, :role, :integer, default: 0
  end
end
