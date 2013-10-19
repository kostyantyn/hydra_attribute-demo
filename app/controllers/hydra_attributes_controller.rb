class HydraAttributesController < ApplicationController
  ENTITY_TYPES = %w[Category Product].freeze

  before_filter :find_entity_class, only: [:new, :create]

  def index
    @hydra_attributes = HydraAttribute::HydraAttribute.where(search_query)
  end

  def new
    @hydra_attribute = @entity_class.hydra_attributes.build
  end

  def edit

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

    def search_query
      query = {}
      if params[:entity_type].in?(ENTITY_TYPES)
        query[:entity_type] = params[:entity_type]
      end
      if params[:name].present?
        query[:name] = params[:name]
      end
      if params[:backend_type].in?(HydraAttribute::SUPPORTED_BACKEND_TYPES)
        query[:backend_type] = params[:backend_type]
      end
      if params[:default_value].present?
        query[:default_value] = params[:default_value]
      end
      if params[:white_list].present?
        query[:white_list] = ActiveRecord::ConnectionAdapters::Column.value_to_boolean(params[:white_list])
      end
      query
    end
end