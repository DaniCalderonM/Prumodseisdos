class CreateApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|
      t.string :kind
      t.references :psuser, null: false, foreign_key: true
      t.references :pspost, foreign_key: true

      t.timestamps
    end
  end
end
