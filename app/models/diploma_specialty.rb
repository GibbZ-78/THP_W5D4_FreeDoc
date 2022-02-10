class DiplomaSpecialty < ApplicationRecord
  belongs_to :diploma                         # Link to 1 diploma
  belongs_to :specialty                       # Link to 1 specialty
end
# Class definition complete