class Roast < ApplicationRecord
  belongs_to :roaster
  has_many :comment, as: :commented_on_id
end
