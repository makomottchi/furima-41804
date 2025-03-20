class DonationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :product, :user, :order

  with_options presence: true do
    validates :city
    validates :prefecture_id
    validates :address
    validates :phone_number
    validates :product
    validates :user
    validates :order
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
   
    order = Order.create(product: product, user_id: user_id)

    Distination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, adress: adress, building_name: building_name, phone_number: phone_number, order: order)
  end

end