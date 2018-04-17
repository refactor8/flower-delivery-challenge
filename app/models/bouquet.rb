class Bouquet < ActiveRecord::Base
  validates :name, :price, presence: true
end
