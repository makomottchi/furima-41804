class Product < ApplicationRecord
  belongs_to :user 
  # has_one :order
  has_one_attached :image
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :prefecture
  belongs_to :category
  belongs_to :shipping_day
  belongs_to :shipping_cost

end
