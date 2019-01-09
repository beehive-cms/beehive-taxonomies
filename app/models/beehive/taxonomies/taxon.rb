module Beehive::Taxonomies
  class Taxon < ApplicationRecord
    belongs_to :taxonomy
  end
end
