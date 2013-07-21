class Code < ActiveRecord::Base
  attr_accessible :body, :name

  acts_as_taggable
  acts_as_taggable_on :tags
end
