class Api::LibrariesController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_library, only: %i[show update destroy]

  def index
    @libraries = if !params[:name].nil?
                   Library.where(name: params[:name])
                 else
                   Library.all
                 end
    render json: @libraries
  end

  def show
    render json: @library
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      render json: @library
    else
      render json: @library.errors, status: :internal_server_error
    end
  end

  def update
    if @library.update(library_params)
      render json: @library
    else
      render json: @library.errors
    end
  end

  def destroy
    @library.destroy
    render json: @library
  end

  private

  def set_library
    @library = Library.find_by(id: params[:id])
    render body: 'id invalida', status: 400 if @library.nil?
  end

  def library_params
    params.require(:library).permit(:name, :address)
  end
end
