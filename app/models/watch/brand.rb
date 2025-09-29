class Watch::Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
