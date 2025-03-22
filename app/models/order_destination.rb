class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :product_id, :user_id, :order_id,
                :token

  with_options presence: true do
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :address,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々ー0-9-]+\z/,
                        message: 'is invalid. Input full-width characters, numbers, or hyphen(-).' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input half-width numbers.' }

    validates :product_id, numericality: { only_integer: true, message: 'must be an integer' }
    validates :user_id, numericality: { only_integer: true, message: 'must be an integer' }
    validates :token, presence: true

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end

  validate :product_exists
  validate :user_exists

  def save
    order = Order.create(product_id: product_id, user_id: user_id)

    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                       building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

  private

  def product_exists
    errors.add(:product_id, 'does not exist') unless Product.exists?(id: product_id)
  end

  def user_exists
    errors.add(:user_id, 'does not exist') unless User.exists?(id: user_id)
  end
end
