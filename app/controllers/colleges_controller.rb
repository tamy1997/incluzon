class CollegesController < ApplicationController
	before_action :authenticate_user! , except: [:confirm]
	def index
		@college = current_user.college
	end

	def new
		@college = College.new
		@user = current_user
	end

	def create
		@college = College.new(college_params)
		if @college.save
			redirect_to colleges_path
		else
		render :new
		end	
	end


  def confirm
     @user = User.find(params[:user])
     @user.verify(params[:pin])
     if @user.verified == true
     	sign_in @user
     	redirect_to new_college_path 
     	
	else
     	redirect_to new_user_registration_path
     end

 end

private

	def college_params
		params.require(:college).permit(:user_id,:start_date,:students,required_services:[],career_streams:[])
	end

end
