class HomesController < ApplicationController
  before_action :authenticate_user! ,except: :city
  
  def dashboard
  
  end
end

 