module Beehive
  module Api
    module V1
      class TaxonomyResource < JSONAPI::Resource
        model_name 'Beehive::Taxonomy'

        attributes :name, :description, :taxons_count

        has_many :taxons
      end
    end
  end
end
