class PostsController < ApplicationController
		def index
			@user = User.find(params[:user_id])
		    @cities = @user.cities
		end

		def new
			@city = City.find_by_id(params[:city_id])
			@post = Post.new
		end

		def create
			@user = current_user
			@post = City.find_by_id(params[:city_id])
				.posts
				.new(post_params)

			@post.user_id = @user.id
			@post.save

			redirect_to user_path(@user.id)

		end

		def show
			@post = Post.find_by_id(params[:id])
		end

		def edit
			post_id = params[:id]
			@post = Post.find_by_id(post_id)
		end
		def update
			post_id = params[:id]
			post = Post.find_by_id(post_id)
			post.update_attributes(post_params)
			if post.save
				redirect_to post_path(post)
			end
		end
		def destroy
			post_id = params[:id]
			post = Post.find_by_id(post_id)
			post.destroy
			redirect_to posts_path
		end

	private

		def post_params
			params.require(:post).permit(:title, :user_id, :city_id, :body)
		end
end
