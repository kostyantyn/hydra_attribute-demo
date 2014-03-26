class Category < ActiveRecord::Base
  include HydraAttribute::ActiveRecord
  include Searchable

  validates :name, presence: true
end
