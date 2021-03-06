class Api::AuthorsController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_author, only: %i[show update destroy]

  def index
    @authors = if !params[:name].nil?
                 Author.where(name: params[:name])
               else
                 Author.all
               end
    render json: @authors
  end

  def show
    render json: @author
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author
    else
      render json: @author.errors, status: :internal_server_error
    end
  end

  def update
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :internal_server_error
    end
  end

  def destroy
    @author.destroy
    render json: @author
  end

  private

  def set_author
    @author = Author.find_by(id: params[:id])
    render body: 'id invalida', status: 400 if @author.nil?
  end

  def author_params
    params.require(:author).permit(:name, :email, :library_id)
  end
end
