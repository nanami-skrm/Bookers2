class UsersController < ApplicationController

	def index
		@user = current_user
		@new_book = Book.new
		@users = User.all
	end

	def show
		@books = Book.where(user_id:params[:id])
		@user = User.find(params[:id])
		@new_book = Book.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: "You have updated user successfully."
		else
			@user = User.find(params[:id])
			render :show
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
