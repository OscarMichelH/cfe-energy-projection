class CreateMunicipalities < ActiveRecord::Migration[5.2]
  def change
    create_table :municipalities do |t|
      t.string :code
      t.string :name
      t.boolean :active

      t.timestamps
    end
    add_reference :municipalities, :state, index: true

  end
end
