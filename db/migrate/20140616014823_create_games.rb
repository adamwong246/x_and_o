class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :x_user_id
      t.integer :o_user_id
      t.string :board

      t.timestamps
    end
  end
end
