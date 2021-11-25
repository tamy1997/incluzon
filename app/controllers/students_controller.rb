class StudentsController < ApplicationController
	def index
		@students = current_user.students.order(created_at: "ASC")
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		@student.save
		UserMailer.with(student: @student).confirm_student.deliver_now
		redirect_to students_path
	end

	def import
    Student.import(params[:file],current_user)
    redirect_to students_path
  	end

  	def export_list
  		students = []
      	file_name = "student-"+".csv"
        @students = Student.all
      	@students.all.each do |u|
	        data = {first_name: u.first_name, last_name: u.last_name,email: u.email,dob: u.dob,number: u.number,specialization: u.specialization,current_year: u.current_year,graduate_year: u.graduate_year}
	        students << data
   		end
   
       if students.present?
       		attributes = ['first_name','last_name','email','dob','number','specialization','current_year','graduate_year']
            CSV.open("#{Rails.root}/public/"+file_name, "ab" ,headers: true) do |csv|
            	csv << attributes
		        students.each do |student|
			       attributes[0]  = student.values[0]
			       attributes[1]  = student.values[1]
			       attributes[2]  = student.values[2]
			       attributes[3]  = student.values[3]
			       attributes[4]  = student.values[4]
			       attributes[5]  = student.values[5]

			       csv << attributes
		   		end
   			end
       	end
       	send_file("#{Rails.root}/public/#{file_name}",filename: file_name,type: "application/csv")
         	
  	end


	private

	def student_params
		params.require(:student).permit(:user_id,:first_name,:last_name,:email,:number,:dob,:specialization,:current_year,:graduate_year,:gender,career_streams:[])
	end
end
