class ItemsController < ApplicationController
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

  private

  def item_params
    params.require(:item).permit(
      :id,
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
end
