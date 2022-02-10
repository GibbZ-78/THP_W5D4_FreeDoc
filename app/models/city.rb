class City < ApplicationRecord
  has_many :doctors                 # can be linked to 0..N doctors
  has_many :patients                # can be linked to 0..N patients
  has_many :appointments            # can be linked to 0..N appointments
end
# Class definition complete