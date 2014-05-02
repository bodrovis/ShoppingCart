# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  quantity   :integer          default(1)
#  user_id    :integer
#  product_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
end
