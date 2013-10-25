class Code < ActiveRecord::Base
	require 'nokogiri'
	# attr_accessible :body, :name, :category_id, :url, :preview, :tag_list
	before_save :render_body
	acts_as_taggable

	# custom slug method defined in lib/app_utilities.rb
	# initialized in config/initializers/active_record_extensions.rb
	custom_slugs_with(:slug)

	def before_save
		url = url.downcase
		# body_scrape = Nokogiri::HTML(body)
		# frag.xpath("//code").each do |code|
		# 	code.inner_html.gsub("<", "&lt;")
		# end
		# body = body_scrape
		# body = "asd"
	end

	private
		def render_body
			require 'redcarpet'
			# renderer = Redcarpet::Render::HTML.new(:filter_html => true, :hard_wrap => true, :autolink => true)
			renderer = PygmentizeHTML
			extensions = {:autolink => true, :hard_wrap => true, :space_after_headers => true, :highlight => true, :tables => true, :fenced_code_blocks => true, :gh_blockcode => true}
			redcarpet = Redcarpet::Markdown.new(renderer, extensions)
			self.body = redcarpet.render self.body_input
		end
end

class PygmentizeHTML < Redcarpet::Render::HTML
	def block_code(code, language)
		require 'pygments'
		Pygments.highlight(code, lexer: language.to_sym, options: {lineanchors: 'line'})
	end
end