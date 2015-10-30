class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :type
      t.string :breed
      t.string :age
      t.string :weight
      t.datetime :lastvisit

      t.timestamps null: false
    end
  end
end
