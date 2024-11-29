class CreateAirports < ActiveRecord::Migration[7.2]
  def change
    create_table :airports do |t|
      t.text :code
      t.text :name

      t.timestamps
    end
  end
end
