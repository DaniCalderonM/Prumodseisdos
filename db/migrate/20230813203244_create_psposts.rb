class CreatePsposts < ActiveRecord::Migration[7.0]
  def change
    create_table :psposts do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
