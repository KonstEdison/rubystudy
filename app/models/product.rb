class Product < ApplicationRecord
  # Establishes that each product belongs to a defendant
  belongs_to :defendant
end
