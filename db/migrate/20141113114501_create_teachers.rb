require_relative '../../config'

# This is where you should use an ActiveRecord migration to
# HINT: checkout ActiveRecord::Migration.create_table

class CreateTeachers < ActiveRecord::Migration

  def up
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone_number
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
    drop_table :teachers
  end
end