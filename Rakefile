require 'rake'
require 'rspec/core/rake_task'
require_relative 'config'
require_relative 'lib/students_importer'
require_relative 'lib/teachers_importer'
require_relative 'app/models/student'

#Create 
desc "create the database"
task "db:create" do
  touch 'db/ar-students_and_teachers.sqlite3'
end

# desc "assign students to teachers"
# task "db:assign" do 
#   Student.assign
# end


#Drop
desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students_and_teachers.sqlite3'
end


#Migrate
desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data and assign students to teachers"
task "db:populate" do
  StudentsImporter.new.import
  TeachersImporter.new.import
  Student.assign
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
