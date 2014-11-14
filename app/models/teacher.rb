class Teacher < ActiveRecord::Base

  has_many :courses
  has_many :students, through: :courses
  
  validates :email, uniqueness: true
    
end

