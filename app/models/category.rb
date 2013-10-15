class Category < ActiveRecord::Base
  include HydraAttribute::ActiveRecord

  attr_accessible :name
end
