module Beehive
  class Taxon < ApplicationRecord
    belongs_to :taxonomy, counter_cache: true
  end
end
