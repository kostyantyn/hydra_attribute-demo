class Product < ActiveRecord::Base
  include HydraAttribute::ActiveRecord
  include Searchable

  validates :name, presence: true
  validates :sku,  presence: true, uniqueness: {case_sensitive: false}
end
