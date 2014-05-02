# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#

class Product < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
end
