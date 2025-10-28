class ApplicationController < ActionController::Base
  helper_method :current_cart

  private

  def current_cart
    cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] = cart.id
    cart
  end
end