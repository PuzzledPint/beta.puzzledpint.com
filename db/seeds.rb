# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role_admin = Role.create({ name: 'admin' })
role_location = Role.create({ name: 'location_gc' })

city_portland = City.create({name: 'Portland', country: 'US'})

Admin.create({email: 'root@localhost', full_name: 'Root Admin', password: 'rootpassword', roles: [role_admin], cities: [city_portland]})

