namespace :db do
  namespace :seed do
    desc "create admin user"
    task user: [:environment] do
      EMAIL = 'root@localhost'.freeze
      PASSWORD = 'rootpassword'.freeze
      puts 'Creating default admin user'
      role_admin = Role.find_by(name: 'admin')
      city_portland = City.create(name: 'Portland', country: 'US')
      Admin.create(email: EMAIL,
                   full_name: 'Root Admin',
                   password: PASSWORD,
                   roles: [role_admin],
                   cities: [city_portland])
      puts "Created initial admin user:"
      puts "  email:    #{EMAIL}"
      puts "  password: #{PASSWORD}"
    end
  end
end
