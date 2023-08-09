class Customer < ApplicationRecord
  belongs_to :province
  has_many :orders, inverse_of: :customer
  validates :name, :address, :email, :province_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[address created_at email id name province_id updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[orders province]
  end
end
