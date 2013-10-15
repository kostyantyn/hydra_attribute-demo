class HydraAttributesController < ApplicationController
  ENTITY_TYPES = %w[Category Product].freeze

  before_filter :find_entity_class, only: [:new, :create]

  def index
    @hydra_attributes = HydraAttribute::HydraAttribute.all
  end

  def new
    @hydra_attribute = @entity_class.hydra_attributes.build
  end

  def create
    @hydra_attribute = @entity_class.hydra_attributes.create(hydra_attribute_params)
    respond_with(@hydra_attribute, location: hydra_attributes_path)
  end

  private
    def find_entity_class
      return redirect_to(root_path) unless params[:entity_type].in?(ENTITY_TYPES)
      @entity_class = params[:entity_type].constantize
    end

    def hydra_attribute_params
      params[:hydra_attribute].reverse_merge(default_value: nil)
    end
end