class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.references :inviter, foreign_key: {to_table: :users}
      t.references :invitee, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
