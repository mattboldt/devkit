class Doc < ActiveRecord::Base
	attr_accessible :title, :body, :url, :tool_id
	belongs_to :tool
end
