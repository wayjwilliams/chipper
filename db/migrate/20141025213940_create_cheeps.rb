class CreateCheeps < ActiveRecord::Migration
  def change
    create_table :cheeps do |t|
      t.integer :user_id
      t.string :cheep_talk

      t.timestamps
    end
  end
end
