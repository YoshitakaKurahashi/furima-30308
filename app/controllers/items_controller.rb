class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.valid?
      redirect_to item_path
    else
      @item = item
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name,
      :item_explanation,
      :item_category_id,
      :item_status_id,
      :delivery_fee_id,
      :prefecture_id,
      :delivery_day_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
