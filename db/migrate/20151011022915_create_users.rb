class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.belongs_to :role

      t.timestamps null: false
    end
  end
end
