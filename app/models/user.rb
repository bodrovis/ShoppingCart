# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  nickname   :string(255)
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy

  def user_name
    nickname.to_s == '' ? name : nickname
  end

  def add_to_cart(product)
    current_product = cart_items.find_by(product_id: product.id)
    if current_product
      current_product.quantity += 1
    else
      current_product = cart_items.build(product_id: product.id)
    end
    current_product
  end

  def self.from_omniauth(auth)
    info = auth['info']

    user = User.find_or_initialize_by(uid: auth['uid'])

    user.nickname = info['nickname']
    user.name = info['name']
    user.save
    user
  end
end
