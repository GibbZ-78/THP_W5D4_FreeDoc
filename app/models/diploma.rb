class Diploma < ApplicationRecord
  has_many :doctor_diplomas, dependent: :destroy              # Link with the joint table 'doctor_diploma'
  has_many :doctors, through: :doctor_diplomas                # Can be linked to 0..N 'doctors' via the joint table above
  has_many :diploma_specialties, dependent: :destroy          # Link with the joint table 'diploma_specialties'
  has_many :specialites, through: :diploma_specialties        # Can be linked to 0..N 'specialties' via the joint table above
end
# Class definition complete