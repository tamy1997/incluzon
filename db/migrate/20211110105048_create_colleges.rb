class CreateColleges < ActiveRecord::Migration[6.1]
  def change
    create_table :colleges do |t|
      t.string :required_services, array: true, default: []
      t.string :career_streams, array: true, default: []
	  t.datetime :start_date
      t.integer :students

      t.timestamps
    end
  end
end
