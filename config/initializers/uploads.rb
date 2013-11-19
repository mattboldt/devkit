Paperclip.interpolates('tool_id') do |attachment, style|
	Tool.find(attachment.instance.tool_id).slug
end