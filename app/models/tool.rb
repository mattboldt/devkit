class Tool < ActiveRecord::Base
	attr_accessible :body, :head, :title, :url, :desc, :category_id
	has_many :docs
	def to_param
		url
	end

	accepts_nested_attributes_for :docs

	# searchable do
	# 	text :title, :desc
	# end

	acts_as_taggable
	acts_as_taggable_on :tags
end
