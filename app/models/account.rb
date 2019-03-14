class Account < ApplicationRecord
  has_many :posts, :followers
end
