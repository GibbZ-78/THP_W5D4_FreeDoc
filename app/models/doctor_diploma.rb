class DoctorDiploma < ApplicationRecord
  belongs_to :diploma                     # Link with 1 diploma
  belongs_to :doctor                      # Link with 1 doctor
end
# Class definition complete