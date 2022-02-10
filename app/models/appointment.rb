class Appointment < ApplicationRecord
  belongs_to :doctor                      # link with 1 doctor
  belongs_to :patient                     # link with 1 patient
  belongs_to :city                        # link with 1 city
end
# Class definition complete
