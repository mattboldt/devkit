module ApplicationHelper
	def title(page_title)
  		content_for :title, page_title.to_s
	end
	# def markdown(text)
	# 	renderer = Redcarpet::Render::HTML.new(:filter_html => true, :hard_wrap => true, :autolink => true)
	# 	markdown = Redcarpet::Markdown.new(renderer, :autolink => true, :space_after_headers => true, :highlight => true, :tables => true, :fenced_code_blocks => true, :gh_blockcode => true)
	# 	raw syntax_highlighter(markdown.render(text))
	# end
	# def syntax_highlighter(html)
 #    doc = Nokogiri::HTML(html)
 #    doc.search("//pre[@lang]").each do |pre|
 #      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
 #    end
 #    doc.to_s
 #  end

end


# class PygmentizeHTML < Redcarpet::Render::HTML
#   def block_code(code, language)
#     require 'pygmentize'
#     Pygmentize.process(code, language)
#   end
# end