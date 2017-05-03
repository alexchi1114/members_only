class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			flash[:success] = "Your post has been submitted."
			redirect_to root_path
		else
			render 'new'
		end
	end


	private

	def post_params
  		params.require(:post).permit(:subject, :body)
 	end
end
