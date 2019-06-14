class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :code
      t.string :name
      t.string :abrev
      t.boolean :active

      t.timestamps
    end
  end
end
