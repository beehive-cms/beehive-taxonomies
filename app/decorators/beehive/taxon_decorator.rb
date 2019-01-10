module Beehive
  class TaxonDecorator < ApplicationDecorator
    def to_s
      object.name
    end
  end
end
