module Beehive
  module Taxonomies
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
