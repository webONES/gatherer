class Post < ActiveRecord::Base
  default_scope do
    order("created_at DESC")
  end
  belongs_to :user

  validates_presence_of :user_id
end
