class BooksController < ApplicationController
  def new; end

  def index
    @categories = Category.all
    @authors = Author.all
    @q = Book.search(params[:q])
    @search = @q.result(distinct: true)

    @pagy, @books = pagy(@search.order('created_at DESC'), items: 9)
    # @books = Book.all.order("created_at DESC").page(params[:page]).per_page(9)
    @sort = ['Default', 'Name of book', 'Name of author']
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @books }
      # format.xls{send_data @full_books.to_csv(col_sep: "\t")}
    end
    # byebug
  end

  private

  def book_params
    params.require(:book).permit(:name, :quantity, :publisher,
                                 :page, :author_id, :book_img,
                                 bookcategories_attributes: %i[book_id category_id _destroy])
  end

  def find_book
		@book = Book.find(params[:id])
	end

	def find_user
		@user = current_user
	end
end
