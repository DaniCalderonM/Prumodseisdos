class AddPsusersToPsposts < ActiveRecord::Migration[7.0]
  def change
    add_reference :psposts, :psuser, foreign_key: true
  end
end
