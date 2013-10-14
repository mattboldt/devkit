class Code < ActiveRecord::Base
	# attr_accessible :body, :name, :category_id, :url, :preview, :tag_list
	validates_uniqueness_of :url
	acts_as_taggable
	def to_param
		url
	end
	def before_save
		url = url.downcase
	end
end