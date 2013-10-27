# == Schema Information
#
# Table name: docs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  url        :string(255)
#  tool_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Doc < ActiveRecord::Base
	# attr_accessible :title, :body, :url, :tool_id
	belongs_to :dev_tool
	validates_uniqueness_of :url
	def to_param
		url
	end
	def before_save
		url = url.downcase
	end
end
