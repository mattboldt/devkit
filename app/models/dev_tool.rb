# == Schema Information
#
# Table name: dev_tools
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  desc        :string(255)
#  head        :text
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#  url         :string(255)
#  category_id :integer
#

class DevTool < ActiveRecord::Base
	# attr_accessible :body, :head, :title, :url, :desc, :category_id
	validates_uniqueness_of :url
	has_many :docs
	acts_as_taggable

	# custom slug method defined in lib/app_utilities.rb
	# initialized in config/initializers/active_record_extensions.rb
	custom_slugs_with(:url)
	def before_save
		url = url.downcase
	end
	accepts_nested_attributes_for :docs

	# searchable do
	# 	text :title, :desc
	# end

	# acts_as_taggable
	# acts_as_taggable_on :tags
end
