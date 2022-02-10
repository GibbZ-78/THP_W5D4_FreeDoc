class CreateDiplomaSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :diploma_specialties do |t|
      t.references :diploma, foreign_key: true, index: true       # link to 1..N diploma object(s), each of them owned by 1 doctor
      t.references :specialty, foreign_key: true, index: true     # link to 1..N specialty objext(s)
      t.timestamps                                                # Object creation & update timestamping
    end
  end
end
# Table definition complete