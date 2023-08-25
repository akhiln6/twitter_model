class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :mobilenumber
      t.text :address

      t.timestamps
    end
  end
end
