class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :move_to_index, except: [:index, :show, :search]



  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else  
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private
  def item_params
    params.require(:item).permit(:image, :company_name, :name, :nomikuchi_id, :nomikata_id, :description).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
