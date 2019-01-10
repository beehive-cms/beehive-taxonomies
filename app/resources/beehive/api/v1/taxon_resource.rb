module Beehive
  module Api
    module V1
      class TaxonResource < JSONAPI::Resource
        model_name 'Beehive::Taxon'

        attributes :name, :description, :taxonomy_id

        belongs_to :taxonomy
      end
    end
  end
end
