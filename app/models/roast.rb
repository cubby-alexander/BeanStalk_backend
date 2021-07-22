class Roast < ApplicationRecord
  belongs_to :roaster
  has_many :comment, dependent: :destroy
end
