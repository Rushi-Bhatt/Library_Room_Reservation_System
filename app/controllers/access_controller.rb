class AccessController < ApplicationController
 layout false
  before_filter :authenticateUser!, :except => ["login","index","attempt_login"]
  
  def index
  end

  def login

  end

  def show

  end

  def admin_view

  end

  def member_view

  end


  def attempt_login
  if params[:username].present? && params[:password].present?
    found_user = Admin.where(:email_id => params[:username]).first
    if found_user
      authorized_user = found_user.authenticate(params[:password])
      session[:admin]=true
      puts "Login successful"
    else # if found_user
      found_user = Member.where(:email_id => params[:username]).first
      if found_user
      authorized_user = found_user.authenticate(params[:password])
      session[:admin]=false
    end
    end

  end   # params present
  if authorized_user
    # mark user as logged in
    session[:userid] = authorized_user.id
    session[:userName] = authorized_user.first_name
    if(authorized_user.class == Admin)
    redirect_to(:action => 'admin_view')
    else
      redirect_to(:action => 'member_view')
    end
  else
    flash[:notice] = "Invalid username/password combination. Please try again"
    #render action: 'show'
    render 'login'
  end
end


def logout
  # mark user as logged out

  reset_session
  redirect_to(:action => "login")
end


end
