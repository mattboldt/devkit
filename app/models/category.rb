class Category < ActiveRecord::Base
	attr_accessible :name, :url
	has_many :codes
	def to_param
		url
	end
end
