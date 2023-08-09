# app/models/tax_rate.rb
class TaxRate < ApplicationRecord
  belongs_to :province

  validates :province_id, :gst_rate, :pst_rate, :hst_rate, presence: true
  validates :province_id, numericality: { only_integer: true }
  validates :gst_rate, :pst_rate, :hst_rate, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "gst_rate", "hst_rate", "id", "province_id", "pst_rate", "updated_at"]
  end
end
