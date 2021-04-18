class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Bruh? I bet someone can try this
  attr_readonly :id
end
