class Tool < ActiveRecord::Base
	attr_accessible :body, :head, :title, :url, :desc
	has_many :docs
	def to_param
		url
	end

	accepts_nested_attributes_for :docs
end
