module Beehive
  class Taxon < ApplicationRecord
    belongs_to :taxonomy
  end
end
