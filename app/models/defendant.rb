class Defendant < ApplicationRecord
  belongs_to :case
  has_many :products
end
