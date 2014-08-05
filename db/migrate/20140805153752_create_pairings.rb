class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :user_id
      t.index :user_id
      t.integer :pair_id
      t.index :pair_id
      t.date :date

      t.timestamps
    end
  end
end
