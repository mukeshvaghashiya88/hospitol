class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :doctorId
      t.integer :userId
      t.integer :petId
      t.boolean :reminder
      t.text :reason

      t.timestamps null: false
    end
  end
end
