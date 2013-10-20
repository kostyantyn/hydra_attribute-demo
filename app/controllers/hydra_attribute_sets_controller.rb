class HydraAttributeSetsController < ApplicationController
  before_filter :find_hydra_attribute, only: [:edit_hydra_set_relations, :update_hydra_set_relations]
  before_filter :find_hydra_set,       only: [:edit_hydra_attribute_relations, :update_hydra_attribute_relations]


  def edit_hydra_set_relations
    @hydra_sets = HydraAttribute::HydraSet.all_by_entity_type(@hydra_attribute.entity_type)
  end

  def update_hydra_set_relations
    HydraAttribute::HydraAttributeSet.all_by_hydra_attribute_id(@hydra_attribute.id).clone.each(&:destroy)

    Array(params[:hydra_set_ids]).each do |hydra_set_id|
      HydraAttribute::HydraAttributeSet.create(hydra_attribute_id: @hydra_attribute.id, hydra_set_id: hydra_set_id)
    end
    redirect_to resource_location
  end

  def edit_hydra_attribute_relations
    @hydra_attributes = HydraAttribute::HydraAttribute.all_by_entity_type(@hydra_set.entity_type)
  end

  def update_hydra_attribute_relations
    HydraAttribute::HydraAttributeSet.all_by_hydra_set_id(@hydra_set.id).clone.each(&:destroy)

    Array(params[:hydra_attribute_ids]).each do |hydra_attribute_id|
      HydraAttribute::HydraAttributeSet.create(hydra_attribute_id: hydra_attribute_id, hydra_set_id: @hydra_set.id)
    end
    redirect_to resource_location
  end

  private
    def find_hydra_set
      @hydra_set = HydraAttribute::HydraSet.find(params[:hydra_set_id])
    end

    def find_hydra_attribute
      @hydra_attribute = HydraAttribute::HydraAttribute.find(params[:hydra_attribute_id])
    end

    def resource_location
      if params.has_key?(:hydra_attribute_id)
        hydra_attribute_path(params[:hydra_attribute_id])
      elsif params.has_key?(:hydra_set_id)
        hydra_set_path(params[:hydra_set_id])
      else
        root_path
      end
    end
end