class Category < ActiveRecord::Base
  include HydraAttribute::ActiveRecord

  attr_accessible :name, :hydra_set_id
end
