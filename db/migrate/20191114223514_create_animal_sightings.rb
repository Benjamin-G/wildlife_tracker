class CreateAnimalSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :animal_sightings do |t|
      t.datetime :date
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
