class Account < ActiveRecord::Base
  belongs_to :user
  validates :user_id,
            :key, 
            :value, 
            presence: true
end
