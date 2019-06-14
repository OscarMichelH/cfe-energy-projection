class Municipality < ApplicationRecord
  belongs_to :state
  has_many :cfe_consumptions
  has_many :cities
end
