class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.bigint :number
      t.datetime :dob
      t.string :specialization
      t.string :current_year
      t.string :graduate_year
      t.string :career_streams, array: true, default: []
      t.string :gender

      t.timestamps
    end
  end
end
