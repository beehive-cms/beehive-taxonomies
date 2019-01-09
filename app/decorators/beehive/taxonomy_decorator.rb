module Beehive
  class TaxonomyDecorator < ApplicationDecorator
    def to_s
      object.name
    end
  end
end
