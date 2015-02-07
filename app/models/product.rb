class Product < ActiveRecord::Base
  belongs_to :post
  attr_accessible :name, :price, :released
end
