class Code < ActiveRecord::Base
  attr_accessible :body, :name, :category_id
  belongs_to :category
end
