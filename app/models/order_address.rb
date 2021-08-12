class OrderAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :tel

  with_options presence: true do
    validates :tel, numericality: { only_integer: true },length: { maximum: 11, minimum: 10}         
    validates :user_id       
    validates :item_id 
  end        
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id) 
    Address.create(tel: tel, order_id: order.id)
  end
end