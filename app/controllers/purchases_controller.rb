class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    # binding.pry
    if @purchase_address.valid?
      # binding.pry
      # @item = Item.find(params[:item_id])
      # pay_item
      # binding.pry
      @purchase_address.save
      # binding.pry
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(
      :postal_code, :prefecture_id, :municipalities, :address, :building, :telephone
    )
    .merge(
      user_id: current_user.id, 
      item_id: params[:item_id]
      # token: params[:token]
    )
  end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: @item.price,
  #     card: purchase_params[:token],
  #     currency: 'jpy'
  #   )
  # end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
