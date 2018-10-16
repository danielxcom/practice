class User < ApplicationRecord
  validates :user, :email, presence: true
end
