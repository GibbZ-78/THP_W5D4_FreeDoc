class Specialty < ApplicationRecord
  has_many :diploma_specialties, dependent: :destroy
  has_many :diplomas, through: :diploma_specialties
end
