class Code < ActiveRecord::Base
  attr_accessible :body, :name, :category_id, :url
  belongs_to :category
  validates_uniqueness_of :url
  def to_param
  	url
  end
end
