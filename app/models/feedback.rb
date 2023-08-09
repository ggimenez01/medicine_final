class Feedback < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
        %w(name email content created_at updated_at) # Adjust this array according to your model's attributes
      end
end
