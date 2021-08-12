class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image
  belongs_to :user
  has_one :order
  has_many :messages
  has_many :messages_seconds
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :sales_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  

  with_options numericality: { other_than: 0 ,message: 'を選択してください' }  do
      validates :category_id 
      validates :sales_status_id 
      validates :prefecture_id
      validates :scheduled_delivery_id
  end

 end
 
