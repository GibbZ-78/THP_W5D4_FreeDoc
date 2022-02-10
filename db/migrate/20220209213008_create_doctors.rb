class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      # t.string :specialty                                 # Case when a doctor had 1 and only 1 specialty. Switched to 0..N diplomas with 1..N specialities each :-)
      # t.references :appointment, index: true              # Understood it was (SQL alike) useless to make the reference symetrical
      # t.references :diploma, index: true                  # Same as above
      t.references :city, foreign_key: true, index: true    # Make the link with 1 city object
      t.timestamps                                          # Object creation & update timestamping
    end
  end
end
# Table definition complete