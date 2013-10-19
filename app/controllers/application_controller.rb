class ApplicationController < ActionController::Base
  HYDRA_ENTITY_TYPES = %w[Category Product].freeze

  protect_from_forgery

  respond_to :html, :json

  helper_method :hydra_entity_types

  private
    def hydra_entity_types
      HYDRA_ENTITY_TYPES
    end
end
