class AddPsusersToPsposts < ActiveRecord::Migration[7.0]
  def change
    add_reference :psposts, :psuser, null: false, foreign_key: true
  end
end
