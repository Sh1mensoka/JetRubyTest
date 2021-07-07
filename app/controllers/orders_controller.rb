require_relative '../../lib/Logistics'

class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    local_params = order_params
    if local_params[:dep_address].present? && local_params[:arr_address].present?
      local_params = local_params.merge(Logistics.create_package(local_params))
    end
    @order = Order.new(local_params)
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:name, :s_name, :patronymic, :phone, :email, :weight, :length, :width, :height,
                                  :dep_address, :arr_address)
  end
end
