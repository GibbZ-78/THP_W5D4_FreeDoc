# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# DESTROY SECTION - Uncomment to truncate all SQLite tables + anihilate all created objects + empty tmp tables
City.destroy_all
Specialty.destroy_all
Appointment.destroy_all
DoctorDiploma.destroy_all
DiplomaSpecialty.destroy_all
Diploma.destroy_all
Doctor.destroy_all
Patient.destroy_all
my_cities = []
my_specialties = []
my_appointments = []
my_doctor_diplomas = []
my_diploma_specialties = []
my_diplomas = []
my_doctors = []
my_patients = []

# POPULATE SECTION - Notice: order of population may be structuring (cannot load data into 'appointments' before 'doctors' and 'patients' exist ;-)
# 01 - Populate 'cities'
100.times do
	my_cities << City.create(city_name: Faker::Address.city, 
                           zip_code: Faker::Address.zip)
end

# 02 - Populate 'specialties'
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
10.times do |n|
  my_diplomas << Diploma.create(title: Faker::Job.education_level)
end

# 04 - Populate 'diploma_specialties' 
#      (i.e for each 'diploma', add it 1 to 3 specialties taken from the 'my_specialties' array)
my_diplomas.length.times do |n|
  rand(1..3).times do |p|
    my_diploma_specialties << DiplomaSpecialty.create(diploma_id: my_diplomas[n-1].id, 
                                                      specialty_id: my_specialties[rand(0...my_specialties.length)].id)
  end
end

# 05 - Populate 'patients'
100.times do |n|
	my_patients << Patient.create(first_name: Faker::Name.first_name, 
                                last_name: Faker::Name.last_name, 
                                city_id: my_cities[rand(0...my_cities.length)].id)
end

# 06 - Populate 'doctors'
20.times do
  my_doctors << Doctor.create(first_name: Faker::Name.first_name, 
                              last_name: Faker::Name.last_name, 
                              city_id: my_cities[rand(0...my_cities.length)].id)
end

# 07 - Populate 'appointments'
60.times do
  my_appointments << Appointment.create(date: Faker::Time.forward(days: 365, period: :all), 
                                        doctor_id: my_doctors[rand(0...my_doctors.length)].id, 
                                        patient_id: my_patients[rand(0...my_patients.length)].id, 
                                        city_id: my_cities[rand(0...my_cities.length)].id)
end

# 08 - Populate 'my_doctor_diplomas'
30.times do |x|
  my_doctor_diplomas << DoctorSpecialty.create(date_obtained: Faker::Date.backward(days: 4000),
                                               expiration_date: Faker::Date.forward(days: 4000),
                                               doctor_id: my_doctors[rand(0...my_doctors.length)].id, 
                                               specialty_id: my_specialties[rand(0...my_specialties.length)].id)
end
