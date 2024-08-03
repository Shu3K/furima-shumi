class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payment
  belongs_to :prefecture
  belongs_to :day

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :payment_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :day_id, numericality: { other_than: 1 , message: "can't be blank" } 

end
