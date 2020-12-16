class BooksController < ApplicationController
  def index
    @books = Book.order('id ASC')
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash.alert = "Book has been created!"
      redirect_to(books_path)
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash.alert = "Book has been updated!"
      redirect_to(books_path)
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash.alert = "Book has been deleted!"
    redirect_to(books_path)
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :published_date)
  end
    

end
