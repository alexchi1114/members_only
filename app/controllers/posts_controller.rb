class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			flash[:success] = "Your post has been submitted."
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def destroy
		Post.find(params[:id]).destroy
		flash[:success] = "Post deleted"
		redirect_to(:back)
	end

	def index 
		@user = current_user
		@posts = Post.paginate(page: params[:page], :per_page => 6).order('created_at DESC')
	end


	private

	def post_params
  		params.require(:post).permit(:subject, :body)
 	end
end
