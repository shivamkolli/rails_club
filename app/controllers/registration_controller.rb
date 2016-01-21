class RegistrationController < Devise::RegistrationsController

	def new
		@user= User.new
	end

	def create
		@user = User.new
		@user.username = params[:user][:username]
		@user.email = params[:user][:email]
		@user.password = params[:user][:password]
		@user.password_confirmation =params[:user][:password_confirmation]
		@user.mobile = params[:user][:mobile]
		@user.address = params[:user][:address]
		@user.avatar = params[:user][:avatar]

		if @user.valid?
			@user.save
			render template: "home/show"
		else
			render :action => "new"
		end
		end

		def show
     	@user = current_user
  	end

  	def update
     	@user = current_user
     if @user.update(user_params)
    	render template: "home/show"
  	 else
    	render 'edit'
  end
  	end

 	private
	def user_params
       params.require(:user).permit(:username, :email, :password, :password_confirmation, :remember_me, :mobile, :address, :avatar)
    end
end