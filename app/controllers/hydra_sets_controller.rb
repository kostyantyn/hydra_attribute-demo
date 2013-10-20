class HydraSetsController < ApplicationController
  before_filter :find_hydra_set,    only: [:show, :edit, :update, :destroy]
  before_filter :find_entity_class, only: [:new, :create]

  def index
    @hydra_sets = HydraAttribute::HydraSet.where(search_query)
    respond_with(@hydra_sets)
  end

  def show
    respond_with(@hydra_set)
  end

  def new
    @hydra_set = @entity_class.hydra_sets.build
    respond_with(@hydra_set)
  end

  def create
    @hydra_set = @entity_class.hydra_sets.create(params[:hydra_set])
    if @hydra_set.persisted?
      flash[:success] = %Q(HydraSet "#{@hydra_set.name}" was created successfully)
    else
      flash.now[:danger] = 'Cannot create HydraSet'
    end
    respond_with(@hydra_set, location: hydra_sets_path)
  end

  def edit
    respond_with(@hydra_set)
  end

  def update
    # TODO add #update_attributes
    @hydra_set.assign_attributes(params[:hydra_set].except(:entity_type))
    if @hydra_set.save
      flash[:success] = %Q(HydraSet "#{@hydra_set.name}" was updated successfully)
    else
      flash.now[:danger] = 'Cannot update HydraSet'
    end
    respond_with(@hydra_set, location: hydra_set_path(@hydra_set))
  end

  def destroy
    if @hydra_set.destroy
      flash[:success] = %Q(HydraSet "#{@hydra_set.name}" was removed successfully)
    end
    respond_with(@hydra_set, location: hydra_sets_path)
  end

  private
    def find_hydra_set
      @hydra_set = HydraAttribute::HydraSet.find(params[:id])
    end

    def find_entity_class
      return redirect_to(root_path) unless params[:entity_type].in?(hydra_entity_types)
      @entity_class = params[:entity_type].constantize
    end

    def search_query
      query = {}
      if params[:entity_type].in?(hydra_entity_types)
        query[:entity_type] = params[:entity_type]
      end
      if params[:name].present?
        query[:name] = params[:name]
      end
      query
    end
end