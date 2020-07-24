module ApplicationHelper
  include Pagy::Frontend

  def cart
    @cart = Cart.where(user_id: current_user.id).last if current_user 
    if @cart 
      return @cart
    else 
      return nil
    end
end
  def requests
    @cart = cart
    if @cart.nil? || @cart.verify != 3
      nil
    else
      @requests = Request.where(cart_id: @cart.id).order('created_at DESC')
      @requests
    end
  end

  # kiem tra xem item co trong gio chua
  def check_item_cart(book_id)
    return if requests.nil?

    check = (book_ids requests).include? book_id
 end
end
