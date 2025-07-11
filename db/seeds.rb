# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed 2 dealerships with 5 cars each
dealerships = Dealership.create!([
  { name: "Downtown Motors", oem: "Toyota" },
  { name: "Uptown Autos", oem: "Honda" },
])

# Create makes for Toyota and Honda
toyota = Make.find_or_create_by!(name: "Toyota")
honda = Make.find_or_create_by!(name: "Honda")

# Create models for Toyota
camry = Model.find_or_create_by!(name: "Camry", make: toyota)
corolla = Model.find_or_create_by!(name: "Corolla", make: toyota)
rav4 = Model.find_or_create_by!(name: "RAV4", make: toyota)
highlander = Model.find_or_create_by!(name: "Highlander", make: toyota)
prius = Model.find_or_create_by!(name: "Prius", make: toyota)

# Create models for Honda
civic = Model.find_or_create_by!(name: "Civic", make: honda)
accord = Model.find_or_create_by!(name: "Accord", make: honda)
crv = Model.find_or_create_by!(name: "CR-V", make: honda)
pilot = Model.find_or_create_by!(name: "Pilot", make: honda)
fit = Model.find_or_create_by!(name: "Fit", make: honda)

cars_data = [
  { year: 2022, make: toyota, model: camry, trim: "SE", count: 3 },
  { year: 2023, make: toyota, model: corolla, trim: "LE", count: 2 },
  { year: 2021, make: toyota, model: rav4, trim: "XLE", count: 4 },
  { year: 2024, make: toyota, model: highlander, trim: "Limited", count: 1 },
  { year: 2020, make: toyota, model: prius, trim: "XLE", count: 2 },
]

cars_data2 = [
  { year: 2022, make: honda, model: civic, trim: "EX", count: 3 },
  { year: 2023, make: honda, model: accord, trim: "Sport", count: 2 },
  { year: 2021, make: honda, model: crv, trim: "EX-L", count: 4 },
  { year: 2024, make: honda, model: pilot, trim: "Touring", count: 1 },
  { year: 2020, make: honda, model: fit, trim: "LX", count: 2 },
]

dealerships[0].cars.create!(cars_data)
dealerships[1].cars.create!(cars_data2)
