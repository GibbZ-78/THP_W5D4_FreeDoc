class CreateSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :specialties do |t|
      t.string :title                                       # Label of the specialty
      # t.references :diploma, index: true                  # Became useless when introducing the join table between diploma & specialty
      t.timestamps                                          # Object creation & update timestamping
    end
  end
end
# Table definition complete