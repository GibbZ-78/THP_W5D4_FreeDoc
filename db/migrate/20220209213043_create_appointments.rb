class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date                                              # Date & hours of the appointment
      t.references :doctor, foreign_key: true, index: true          # Link with the related doctor
      t.references :patient, foreign_key: true, index: true         # Link with the related patient
      t.references :city, foreign_key: true, index: true            # Make the link with 1 city object
      t.timestamps                                                  # Object creation & update timestamping
    end
  end
end
# Table definition complete