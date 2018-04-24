class UsersController < ApplicationController

	def index
		@users = User.all
	end
	def new
		@users = User.new
	end

	def create
	    @user = User.create(user_params)
	    login(@user)
	    redirect_to @user
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
