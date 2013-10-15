class Code < ActiveRecord::Base
	# attr_accessible :body, :name, :category_id, :url, :preview, :tag_list
	validates_uniqueness_of :slug
	acts_as_taggable

	# custom slug method defined in lib/app_utilities.rb
	# initialized in config/initializers/active_record_extensions.rb
	custom_slugs_with(:slug)
	def before_save
		url = url.downcase
	end
end