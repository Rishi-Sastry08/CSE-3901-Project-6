class PagesController < ApplicationController
  # need to filter on due dates that are in the near future 
  before_action :authenticate_user!
  
  require 'date'

  def home
    if current_user.email == "admin@mygenda.com" 
      current_user.update_attribute :admin, true
      
    end

    next_week = Date.today + 7 

  
    if current_user.admin?
        @posts = Post.order(:due_date).where(due_date: (Date.today.to_s)..next_week.to_s)
        
    else
        @posts = Post.order(:due_date).where(due_date: (Date.today.to_s)..next_week.to_s).where(user_id: current_user.email)
        
    end
    
  end
end
