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

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :user, presence: true

  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}

end
