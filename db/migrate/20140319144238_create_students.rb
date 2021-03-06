require_relative '../../config'

# This is where you should use an ActiveRecord migration to
# HINT: checkout ActiveRecord::Migration.create_table

class CreateStudents < ActiveRecord::Migration

  def up
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :phone
      t.date :birthday
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
   drop_table :students
  end
end
