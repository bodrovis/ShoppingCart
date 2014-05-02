class CartItemsController < ApplicationController
  def checkout
    if current_user
      current_user.cart_items.destroy_all
      flash[:success] = 'Thanks!'
      redirect_to root_path
    end
  end

  def create
    respond_to do |format|
      if current_user
        product = Product.find_by_id(params[:product_id])
        if product
          @current_product = current_user.add_to_cart(product)
          if @current_product.save
            format.html { redirect_to root_path, notice: "Added to cart!" }
            format.js
          end
        else
          format.html { redirect_to root_path, notice: "No such product!" }
          format.js {render js: 'alert("No such product!");'}
        end
      else
        format.html { redirect_to root_path, notice: "Please log in to purchase!" }
        format.js {render js: 'alert("Please authenticate!");'}
      end
    end
  end
end