class CreatePsimages < ActiveRecord::Migration[7.0]
  def change
    create_table :psimages do |t|
      t.references :psimageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
