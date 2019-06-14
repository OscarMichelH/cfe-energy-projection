class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :code
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :altitude
      t.string :letter
      t.string :type
      t.integer :population
      t.integer :males
      t.integer :females
      t.integer :homes
      t.decimal :lat
      t.decimal :lng
      t.boolean :active

      t.timestamps
    end
    add_reference :cities, :municipality, index: true

  end
end
