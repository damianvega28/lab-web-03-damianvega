# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Owners
owner1 = Owner.create(first_name: "John", last_name: "Smith", email: "john@gmail.com", phone: "923456789", address: "123 Main Street")
owner2 = Owner.create(first_name: "Sarah", last_name: "Johnson", email: "sarah@gmail.com", phone: "987654321", address: "456 Oak Avenue")
owner3 = Owner.create(first_name: "Michael", last_name: "Brown", email: "michael@gmail.com", phone: "955444333", address: "789 Pine Road")

# Pets
pet1 = owner1.pets.create(name: "Rex", species: "Dog", breed: "Labrador", date_of_birth: "2019-03-15", weight: 28.5)
pet2 = owner1.pets.create(name: "Whiskers", species: "Cat", breed: "Siamese", date_of_birth: "2020-07-20", weight: 4.2)
pet3 = owner2.pets.create(name: "Toby", species: "Dog", breed: "Beagle", date_of_birth: "2018-11-10", weight: 12.0)
pet4 = owner2.pets.create(name: "Fluffy", species: "Rabbit", breed: "Angora", date_of_birth: "2021-05-05", weight: 2.3)
pet5 = owner3.pets.create(name: "Luna", species: "Cat", breed: "Persian", date_of_birth: "2022-01-18", weight: 3.8)

# Vets
vet1 = Vet.create(first_name: "Emily", last_name: "Davis", email: "emily@vetclinic.com", phone: "911222333", specialization: "General Practice")
vet2 = Vet.create(first_name: "Robert", last_name: "Wilson", email: "robert@vetclinic.com", phone: "944555666", specialization: "Surgery")

# Appointments
app1 = Appointment.create(pet: pet1, vet: vet1, date: "2024-01-10 10:00", reason: "Annual checkup", status: 2)
app2 = Appointment.create(pet: pet2, vet: vet1, date: "2024-02-15 11:30", reason: "Vaccination", status: 2)
app3 = Appointment.create(pet: pet3, vet: vet2, date: "2024-03-20 09:00", reason: "Knee surgery", status: 2)
app4 = Appointment.create(pet: pet4, vet: vet1, date: "2024-04-05 14:00", reason: "General checkup", status: 1)
app5 = Appointment.create(pet: pet5, vet: vet2, date: "2024-04-09 16:00", reason: "Skin consultation", status: 0)

# Treatments
Treatment.create(appointment: app1, name: "Deworming", medication: "Drontal", dosage: "1 tablet", notes: "No complications", administered_at: "2024-01-10 10:30")
Treatment.create(appointment: app2, name: "Feline triple vaccine", medication: "Felocell", dosage: "1ml", notes: "Tolerated vaccine well", administered_at: "2024-02-15 11:45")
Treatment.create(appointment: app3, name: "Knee surgery", medication: "General anesthesia", dosage: "Based on weight", notes: "Successful surgery, 2 weeks rest required", administered_at: "2024-03-20 09:30")
Treatment.create(appointment: app4, name: "Dental checkup", medication: "None", dosage: "N/A", notes: "Mild tartar, cleaning recommended", administered_at: "2024-04-05 14:20")
Treatment.create(appointment: app4, name: "Antiparasitic", medication: "Ivermectin", dosage: "0.5ml", notes: "Applied without issues", administered_at: "2024-04-05 14:40")