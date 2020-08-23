class CreateAttendings < ActiveRecord::Migration[5.2]
  def change
    create_table :attendings do |t|
      t.references :attendee, foreign_key: {to_table: :users}
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
