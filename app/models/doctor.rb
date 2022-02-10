class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy                 # Can be linked to 0..N 'appointments'
  has_many :patients, through: :appointments                  # Can be linked to 0..N 'patients' via the 'appointments' table
  has_many :doctor_diplomas, dependent: :destroy              # Can be linked to 0..N 'doctor_diplomas'
  has_many :diplomas, through: :doctor_diplomas               # Can be linked to 0..N 'diplomas' via the 'doctor_diplomas' table
  # has_many :diploma_specialties                             # WARNING: dunno how to manage 'transitivity'
  # has_many :specialties, through: :diploma_specialties      #
  belongs_to :city                                            # Link to 1 city
end
# Class definition complete