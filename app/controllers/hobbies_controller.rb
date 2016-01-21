class HobbiesController < ApplicationController

	def new
		@hobby= Hobby.new
	end

	def create
		@hobby = current_user.hobbies.new
		@hobby.hobby_name = params[:hobby][:hobby_name]
		@hobby.since_from = params[:hobby][:since_from]
		if @hobby.valid? && @hobby.save
			redirect_to user_hobbies_path(user_id: current_user.id)
		else
			render :action => "new"
		end
	end

	def index
	 	#@hobbies = current_user.hobbies
	 	@hobbies = current_user.hobbies.order(:hobby_name).page(params[:page])
	 	#@hobbies = Hobby.page(params[:page])
	 	#@hobbies = current_user.hobbies.limit(10).page(params[:page])
  	end

  	def show
	 	@hobbies = current_user.hobbies
	 	#@hobbies = current_user.hobbies.order(:hobby_name).page params[:page]
  	
  	end

end
