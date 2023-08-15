class CreateJoinTablePsusersPsposts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :psusers, :psposts do |t|
      # t.index [:psuser_id, :pspost_id]
      # t.index [:pspost_id, :psuser_id]
    end
  end
end
