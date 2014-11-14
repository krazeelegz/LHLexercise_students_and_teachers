require_relative '../../config'

class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.belongs_to :student
      t.belongs_to :teacher
      t.timestamps
    end
  end

  def down
    drop_table :courses
  end

end