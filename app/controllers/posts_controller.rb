class PostsController < ApplicationController
		def index
			@user = User.find(params[:user_id])
		    @cities = @user.cities
		end

		def new
			@city = City.find_by_id(params[:city_id])
			@post = Post.new
			@user = current_user
		end

		def create
			@user = current_user.id
			@post = City.find_by_id(params[:city_id])
				.posts
				.new(post_params)

			@post.user_id = @user
			@post.save

			redirect_to user_path(@user)

		end

		def show
			@post = Post.find_by_id(params[:id])
			@city = City.find_by_id(params[:city_id])
			@user = current_user
		end

		def edit
			@city = City.find_by_id(params[:city_id])
			@user = current_user
			post_id = params[:id]
			@post = Post.find_by_id(post_id)
		end

		def update
			post_id = params[:id]
			post = Post.find_by_id(post_id)
			post.update_attributes(post_params)
			if post.save
				redirect_to user_post_path(post)
			end
		end

		def destroy
			@user = current_user
			post_id = params[:id]
			post = Post.find_by_id(post_id)
			post.destroy
			redirect_to user_path(@user)
		end

	private

		def post_params
			params.require(:post).permit(:title, :user_id, :city_id, :body)
		end
end
