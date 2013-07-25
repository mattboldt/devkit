class Doc < ActiveRecord::Base
	attr_accessible :title, :body, :url, :tool_id
	belongs_to :tool
	validates_uniqueness_of :url
	def to_param
		url
	end
	def before_save
		url = url.downcase
	end
end
