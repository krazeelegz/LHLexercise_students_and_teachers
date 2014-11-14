require 'rspec'
require_relative '../config'

describe Teacher, "Sample data" do

  it "should contain one of the teachers from the CSV" do
    Teacher.where("name = ?", "Dallas Araneda").count.should be >= 1
  end
end

describe '#name' do
   
    it "should not allow a duplicate name" do
    teacher = Teacher.new(name: "Dallas Arandeda")
    expect(teacher.errors[:name]) == ["Has already been taken"]
  end
end

# def assign_random_teachers(num)
#   self.teachers += (Teacher.all - self.teachers).shuffle.take(num) unless Teacher.all.length > num
# end