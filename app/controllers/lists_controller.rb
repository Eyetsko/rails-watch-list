class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(required_params)
    if @list.save
      redirect_to @list, notice: 'list was created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: 'list was deleted'
  end

  private

  def required_params
    params.require(:list).permit(:name)
  end

end
