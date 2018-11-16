class Band < ApplicationRecord
  validates :name, :user_id, presence: true
end
