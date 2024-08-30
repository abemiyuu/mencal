class Like < ApplicationRecord
  belongs_to :heart
  belongs_to :user
  validates_uniqueness_of :heart_id, scope: :user_id
end
