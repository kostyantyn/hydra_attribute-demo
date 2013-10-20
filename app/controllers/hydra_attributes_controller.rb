class HydraAttributesController < ApplicationController
  before_filter :find_hydra_attribute, only: [:show, :edit, :update, :destroy]
  before_filter :find_entity_class,    only: [:new, :create]

  def index
    @hydra_attributes = HydraAttribute::HydraAttribute.where(search_query)
    respond_with(@hydra_attributes)
  end

  def show
    respond_with(@hydra_attribute)
  end

  def new
    @hydra_attribute = @entity_class.hydra_attributes.build
    respond_with(@hydra_attribute)
  end

  def create
    @hydra_attribute = @entity_class.hydra_attributes.create(hydra_attribute_params)
    if @hydra_attribute.persisted?
      flash[:success] = %Q(HydraAttribute "#{@hydra_attribute.name}" was created successfully)
    else
      flash.now[:danger] = 'Cannot create HydraAttribute'
    end
    respond_with(@hydra_attribute, location: hydra_attributes_path)
  end

  def edit
    respond_with(@hydra_attribute)
  end

  def update
    # TODO add #update_attributes
    @hydra_attribute.assign_attributes(hydra_attribute_params)
    if @hydra_attribute.save
      flash[:success] = %Q(HydraAttribute "#{@hydra_attribute.name}" was updated successfully)
    else
      flash.now[:danger] = 'Cannot update HydraAttribute'
    end
    respond_with(@hydra_attribute, location: hydra_attribute_path(@hydra_attribute))
  end

  def destroy
    if @hydra_attribute.destroy
      flash[:success] = %Q(HydraAttribute "#{@hydra_attribute.name}" was removed successfully)
    end
    respond_with(@hydra_attribute, location: hydra_attributes_path)
  end

  private
    def find_hydra_attribute
      @hydra_attribute = HydraAttribute::HydraAttribute.find(params[:id])
    end

    def find_entity_class
      return redirect_to(root_path) unless params[:entity_type].in?(hydra_entity_types)
      @entity_class = params[:entity_type].constantize
    end

    def hydra_attribute_params
      params[:hydra_attribute].reverse_merge(default_value: nil)
    end

    def search_query
      query = {}
      if params[:entity_type].in?(hydra_entity_types)
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