class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    cart_item = @cart.cart_items.find_by(product_id: params[:product_id])

    if cart_item
      cart_item.quantity += 1
    else
      cart_item = @cart.cart_items.build(product_id: params[:product_id], quantity: 1)
    end
    
    if cart_item.save
      redirect_to cart_path(@cart), notice: "商品をカートに追加しました。"
    else
      redirect_to products_path, alert: "商品をカートに追加できませんでした。"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_cart), notice: "商品をカートから削除しました。"
  end
end