class Upload < ActiveRecord::Base
	belongs_to :tool
	has_attached_file :attachment,
    	:url => "/custom/tools/:tool_id/:basename.:extension",
    	:path => ":rails_root/public/custom/tools/:tool_id/:basename.:extension"
end
