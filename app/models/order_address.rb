class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone, :order, :item_id, :user_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city 
    validates :address 
    validates :phone 
    validates :item_id 
    validates :token 
  end
   validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
   validates_length_of :phone, in: 10..11
   validates_format_of :phone, with: /\A\d+\z/, message: "は半角数字のみで入力してください"

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end