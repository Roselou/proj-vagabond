class PostsController < ApplicationController
		def index
			@user = User.find(params[:user_id])
	    @cities = @user.cities
		end
		def new
			@post = Post.new
		end
		def create
				@post = Post.create(post_params)
				redirect_to user_post_path(@post.id)
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
