class Supplier < ApplicationRecord
  has_many :products
  validates :name, :address, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["products"]
  end
end
