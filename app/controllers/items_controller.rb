class ItemsController < ApplicationController
  before_action :item_set, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :new]
  before_action :move_to_index, except: [:index, :show, :new, :create]


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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
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
    item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == item.user_id
      redirect_to action: :index
    end
  end

  def item_set
    @item = Item.find(params[:id])
  end

end
