class Tool < ApplicationRecord
  belongs_to :user
  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
end
