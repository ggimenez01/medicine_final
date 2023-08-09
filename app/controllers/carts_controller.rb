# app/controllers/carts_controller.rb

class CartsController < ApplicationController
  def show
    @cart = current_cart
  end

  def add
    id = params[:id].to_s
    current_cart[id] ? current_cart[id] += 1 : current_cart[id] = 1
    redirect_to products_path
  end

  def increase
    id = params[:id]
    current_cart[id] ? current_cart[id] += 1 : current_cart[id] = 1
    redirect_to cart_path
  end

  def decrease
    id = params[:id]
    if current_cart[id] > 1
      current_cart[id] -= 1
    else
      current_cart.delete(id)
    end
    redirect_to cart_path
  end

  def remove
    id = params[:id]
    current_cart.delete(id)
    redirect_to cart_path
  end
end
