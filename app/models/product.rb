class Product < ActiveRecord::Base
  include HydraAttribute::ActiveRecord

  attr_accessible :name, :sku
end
