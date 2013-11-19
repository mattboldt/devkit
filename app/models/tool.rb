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

class Tool < ActiveRecord::Base
	# attr_accessible :body, :head, :title, :slug, :desc, :category_id
	validates_uniqueness_of :slug

	has_many :docs
	accepts_nested_attributes_for :docs
	has_many :uploads
	accepts_nested_attributes_for :uploads

	acts_as_taggable
	validates :name, presence: true
	validates :desc, presence: true
	validates :head, presence: true
	validates :body, presence: true
	validates :tag_list, presence: true

	# custom slug method defined in lib/app_utilities.rb
	# initialized in config/initializers/active_record_extensions.rb
	custom_slugs_with(:slug)
	def before_save
		slug = slug.downcase
	end

	# searchable do
	# 	text :title, :desc
	# end

	# acts_as_taggable
	# acts_as_taggable_on :tags
end
