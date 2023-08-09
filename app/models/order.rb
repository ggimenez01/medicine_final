class Order < ApplicationRecord
  belongs_to :customer, inverse_of: :orders, autosave: true
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user, optional: true

  accepts_nested_attributes_for :customer

  validates :total, :status, :gst, :pst, :hst, :subtotal, presence: true
  validates :total, :gst, :pst, :hst, :subtotal, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at customer_id gst hst id pst status subtotal total updated_at]
  end
end
