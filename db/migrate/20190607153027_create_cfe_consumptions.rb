class CreateCfeConsumptions < ActiveRecord::Migration[5.2]
  def change
    create_table :cfe_consumptions do |t|
      t.string :cfe_fee
      t.date :year
      t.float :intake_kwh

      t.timestamps
    end
    add_reference :cfe_consumptions, :municipality, index: true

  end
end
