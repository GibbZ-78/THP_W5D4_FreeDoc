class CreateDoctorDiplomas < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_diplomas do |t|
      t.date :date_obtained                                       # Date the diploma was passed by the doctor
      t.date :expiration_date                                     # End of diploma validity (should be optional, e.g. "nil" if never expirate)
      t.references :doctor, foreign_key: true, index: true        # link to 1..N doctor object(s)
      t.references :diploma, foreign_key: true, index: true       # link to 1..N specialty objext(s)
      t.timestamps                                                # Object creation & update timestamping
    end
  end
end
# Table definition complete