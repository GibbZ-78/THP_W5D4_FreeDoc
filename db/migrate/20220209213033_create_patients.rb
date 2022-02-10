class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name                                  # First name of the patient
      t.string :last_name                                   # Family name of the patient
      # t.references :appointment, index: true              # Understood it was useless (alike SQL) to make the reference symetrical
      t.references :city, foreign_key: true, index: true    # Make the link with 1 city object
      t.timestamps                                          # Object creation & update timestamping 
    end
  end
end
# Table definition complete