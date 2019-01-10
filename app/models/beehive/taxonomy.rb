module Beehive
  class Taxonomy < ApplicationRecord
  	has_many :taxons, counter_cache: true
  end
end
