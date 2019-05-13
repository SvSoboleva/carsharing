class User < ApplicationRecord
  validates :nickname, presence: true
  validates :role, presence: true
end
