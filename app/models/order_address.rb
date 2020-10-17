class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid. Not include hyphen(-)" }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }



end