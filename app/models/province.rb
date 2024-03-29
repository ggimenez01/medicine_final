# app/models/province.rb
class Province < ApplicationRecord
  has_many :tax_rates
  has_many :users

  validates :name, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["tax_rates"]
  end
end
