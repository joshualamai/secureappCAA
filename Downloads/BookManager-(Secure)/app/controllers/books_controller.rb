class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    # Vulnerable to SQL Injection
    if params[:search]
      @books = Book.where("title LIKE '%#{params[:search]}%' OR author LIKE '%#{params[:search]}%'")
    else
      @books = Book.all
    end
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book was successfully created.'
    else
      flash[:alert] = @book.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: 'Book was successfully updated.'
    else
      flash[:alert] = @book.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :published_date, :description)
  end
end