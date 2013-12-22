class Product < ActiveRecord::Base
  include HydraAttribute::ActiveRecord
  include Searchable

  attr_accessible :name, :sku, :hydra_set_id

  validates :name, presence: true
  validates :sku,  presence: true, uniqueness: {case_sensitive: false}
end
