class BooksController < ApplicationController

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id

		if @book.save
			redirect_to book_path(@book.id)
		else
			@books = Book.all
			render :index
		end
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)

	end

end