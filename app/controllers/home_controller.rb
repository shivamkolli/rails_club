class HomeController < ApplicationController
	def new
		@user=User.new(user_params)
		if @user.save
      redirect_to @user, notice: 'User was successfully created.' 
    else
      render action: 'new'
    end       
  end
#end
	private
	def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :remember_me, :mobile, :address, :avatar)
    end
end
