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

toyota = Make.find_or_create_by!(name: "Toyota")
honda = Make.find_or_create_by!(name: "Honda")

cars_data = [
  { year: 2022, make: toyota, model: "Camry", trim: "SE", count: 3 },
  { year: 2023, make: toyota, model: "Corolla", trim: "LE", count: 2 },
  { year: 2021, make: toyota, model: "RAV4", trim: "XLE", count: 4 },
  { year: 2024, make: toyota, model: "Highlander", trim: "Limited", count: 1 },
  { year: 2020, make: toyota, model: "Prius", trim: "XLE", count: 2 },
]

cars_data2 = [
  { year: 2022, make: honda, model: "Civic", trim: "EX", count: 3 },
  { year: 2023, make: honda, model: "Accord", trim: "Sport", count: 2 },
  { year: 2021, make: honda, model: "CR-V", trim: "EX-L", count: 4 },
  { year: 2024, make: honda, model: "Pilot", trim: "Touring", count: 1 },
  { year: 2020, make: honda, model: "Fit", trim: "LX", count: 2 },
]

dealerships[0].cars.create!(cars_data)
dealerships[1].cars.create!(cars_data2)
