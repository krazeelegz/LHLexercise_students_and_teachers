class Student < ActiveRecord::Base

  has_many :courses
  has_many :teachers, through: :courses

  def self.assign
    print "Assigning students to teachers"
    all_students = []
    Student.all.each { |student| all_students << student }
    while all_students.count > 0
      Teacher.all.each do |teacher|
      teacher.students << all_students[0] if all_students.count > 0
      all_students.delete_at(0)
      print "."; STDOUT.flush
      end
    end
    puts "\nDONE"
  end

end

# class method to assign students to teachers
  # must update rake file: require_relative and desc task 
  # able to run rake db:assign to test whether working (add puts)
  # def self.assign
  #   all_students = []
  #   # returns an array with all students in it
  #   Student.all.each { |student| all_students << student }

  #   # loop through students when greater than 0
  #   while all_students.count > 0
  #   # returns an array with all teachers in it
  #   # iterate through the array of teachers 
  #     Teacher.all.each do |teacher|
  #       # note: teacher has many students 
  #       # teacher.students is an array that will hold all the students that a teacher has
  #       # adds first student in all_students array to teacher.students array for that particular teacher 
  #       # -> those references of the student belong to him) 
  #       teacher.students << all_students[0] if all_students.count > 0
  #       # and removes the added student
  #       all_students.delete_at(0)
  #     end
  #   end