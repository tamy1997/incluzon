class Student < ApplicationRecord
	belongs_to :user
	def self.import(file,user)
    	CSV.foreach(file.path, headers: true) do |row|
	    	 data = row.to_hash
	    	 data[:user_id] = user.id
	      	Student.create! data
    	end
  	end
end
