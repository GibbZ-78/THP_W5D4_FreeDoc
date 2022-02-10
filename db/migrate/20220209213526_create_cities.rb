class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city_name         # Name of the city
      t.string :zip_code          # Postal code of the city (hypothesis : only 1 zip / city... Which is false)
      t.timestamps                # Object creation & update timestamping 
    end
  end
end
# Table definition complete