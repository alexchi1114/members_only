class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome to Members Only"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def index
	end

	def show
		@user = User.find(params[:id])
		@posts = Post.where(:user_id => @user.id).paginate(page:params[:page],per_page: 5).order('created_at desc')
	end

	private 

  	def user_params
  		params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
 	 end
end
