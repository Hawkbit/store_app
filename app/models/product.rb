class Product < ActiveRecord::Base
	validates :productCode, presence: true
end
