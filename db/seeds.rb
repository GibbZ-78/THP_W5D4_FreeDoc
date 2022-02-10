# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "*** Started at #{Time.now} ***"

# DESTROY SECTION - Uncomment to truncate all SQLite tables + anihilate all created objects + empty tmp tables
puts "[DESTROY SECTION - BEGIN]"
puts "  > Destroying objects and deleting from tables"
City.destroy_all
Specialty.destroy_all
Appointment.destroy_all
DoctorDiploma.destroy_all
DiplomaSpecialty.destroy_all
Diploma.destroy_all
Doctor.destroy_all
Patient.destroy_all
puts "  > Initializing arrays as []"
my_cities = []
my_specialties = []
my_appointments = []
my_doctor_diplomas = []
my_diploma_specialties = []
my_diplomas = []
my_doctors = []
my_patients = []
puts "[DESTROY SECTION - END]"
puts

# POPULATE SECTION - Notice: order of population may be structuring (cannot load data into 'appointments' before 'doctors' and 'patients' exist ;-)
# 01 - Populate 'cities'
puts "[POPULATE SECTION - BEGIN]"
puts "  > Populating 'my_cities'"
100.times do
	my_cities << City.create(city_name: Faker::Address.city, 
                           zip_code: Faker::Address.zip)
end

# 02 - Populate 'specialties'
puts "  > Populating 'my_specialties'"
10.times do |n|
  my_specialties << Specialty.create(title: ["Specialist in Allergy and Immunology",
                                             "Radiologist",
                                             "Anesthesiologist",
                                             "General Practicionner",
                                             "Cardiologist", 
                                             "Dentist", 
                                             "Dermatologist",
                                             "Neurologist", 
                                             "Surgeon", 
                                             "Pediatrist"][n-1])
end

# 03 - Populate 'diplomas'
puts "  > Populating 'my_diplomas'"
10.times do |n|
  my_diplomas << Diploma.create(title: Faker::Job.education_level)
end

# 04 - Populate 'diploma_specialties' 
#      (i.e for each 'diploma', add it 1 to 3 specialties taken from the 'my_specialties' array)
puts "  > Populating 'my_diploma_specialties'"
my_diplomas.length.times do |n|
  rand(1..3).times do |p|
    my_diploma_specialties << DiplomaSpecialty.create(diploma_id: my_diplomas[n-1].id, 
                                                      specialty_id: my_specialties[rand(0...my_specialties.length)].id)
  end
end

# 05 - Populate 'patients'
puts "  > Populating 'my_patients'"
100.times do |n|
	my_patients << Patient.create(first_name: Faker::Name.first_name, 
                                last_name: Faker::Name.last_name, 
                                city_id: my_cities[rand(0...my_cities.length)].id)
end

# 06 - Populate 'doctors'
puts "  > Populating 'my_doctors'"
20.times do
  my_doctors << Doctor.create(first_name: Faker::Name.first_name, 
                              last_name: Faker::Name.last_name, 
                              city_id: my_cities[rand(0...my_cities.length)].id)
end

# 07 - Populate 'appointments'
puts "  > Populating 'my_appointments'"
60.times do
  my_appointments << Appointment.create(date: Faker::Time.forward(days: 365, period: :all), 
                                        doctor_id: my_doctors[rand(0...my_doctors.length)].id, 
                                        patient_id: my_patients[rand(0...my_patients.length)].id, 
                                        city_id: my_cities[rand(0...my_cities.length)].id)
end

# 08 - Populate 'my_doctor_diplomas'
puts "  > Populating 'my_doctor_diplomas'"
30.times do |x|
  my_doctor_diplomas << DoctorDiploma.create(date_obtained: Faker::Date.backward(days: 4000),
                                               expiration_date: Faker::Date.forward(days: 4000),
                                               doctor_id: my_doctors[rand(0...my_doctors.length)].id, 
                                               diploma_id: my_diplomas[rand(0...my_diplomas.length)].id)
end

puts "[POPULATE SECTION - END]"

puts "*** Ended at #{Time.now} ***"