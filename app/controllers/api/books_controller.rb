class Api::BooksController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_book, only: %i[show update destroy]
  def index
    @books = if !params[:title].nil?
               Book.where(title: params[:title])
             else
               Book.all
             end
    render json: @books
  end

  def show
    render json: @book
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book
    else
      render json: @book.errors
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors
    end
  end

  def destroy
    @book.destroy
    render json: @book
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
    render body: 'id invalida', status: 400 if @book.nil?
  end

  def book_params
    params.require(:book).permit(:title, :author_id)
  end
end
