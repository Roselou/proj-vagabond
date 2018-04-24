class UsersController < ApplicationController

	def index
		@users = User.all
		@city = City.find_by_id(params[:id])
		@cities = City.all
	end
	def new
		@users = User.new

	end

	def create
	    @user = User.create(user_params)
	    if @user.save
	        flash[:notice] = ""
	    	login(@user)
	    	redirect_to @user
	    else
	      puts "Email already taken" * 100
	      flash[:error] = "Email already taken"
	      redirect_to new_user_path
		end
	end

	def show
	    @user = User.find_by_id(params[:id])
	    @posts = @user.posts
	    post_id = params[:id]
			@post = Post.find_by_id(post_id)
	end

	def edit
		user_id = params[:id]
		@user = User.find_by_id(user_id)
	end
	def update
		user_id = params[:id]
		user = User.find_by_id(user_id)
		user.update_attributes(user_params)
		if user.save
			redirect_to user_path(user)
		end
	end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :current_city, :avatar)
  end
end
