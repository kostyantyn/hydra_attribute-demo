class Category < ActiveRecord::Base
  include HydraAttribute::ActiveRecord
  include Searchable

  attr_accessible :name, :hydra_set_id

  validates :name, presence: true
end
