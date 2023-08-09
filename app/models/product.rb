class Product < ApplicationRecord
  belongs_to :category

  mount_uploader :image, ImageUploader
  has_many :orders
  belongs_to :supplier

  validates :name, :description, :image, :category_id, :price, :uom, :supplier_id, presence: true
  validates :category_id, :supplier_id, numericality: { only_integer: true }
  validates :price, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "image", "mat_id", "name", "price",
     "supplier_id", "uom", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category supplier orders]
  end

  def self.ransackable_attributes(auth_object = nil)
    super + ["on_sale"]
  end
end
