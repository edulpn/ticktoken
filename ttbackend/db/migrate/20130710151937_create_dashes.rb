class CreateDashes < ActiveRecord::Migration
  def change
    create_table :dashes do |t|
      t.integer :user_id
      t.integer :clock_in_out
      t.datetime :dash_at

      t.timestamps
    end
  end
end
