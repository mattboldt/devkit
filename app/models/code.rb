# == Schema Information
#
# Table name: codes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  slug        :string(255)
#  preview     :text
#  raw         :text
#  filetype    :string(255)      default("txt")
#  body_input  :text
#

class Code < ActiveRecord::Base
	require 'nokogiri'
	before_save :render_body, :defaults
	acts_as_taggable
	validates :name, presence: true
	validates :preview_input, presence: true
	validates :body_input, presence: true
	validates :tag_list, presence: true

	# custom slug method defined in lib/app_utilities.rb
	# initialized in config/initializers/active_record_extensions.rb
	custom_slugs_with(:slug)

	def defaults
		self.filetype ||= "txt"
	end

	private
		def render_body
			require 'redcarpet'
			# renderer = Redcarpet::Render::HTML.new(:filter_html => true, :hard_wrap => true, :autolink => true)
			renderer = PygmentizeHTML
			extensions = {:autolink => true, :hard_wrap => true, :space_after_headers => true, :highlight => true, :tables => true, :fenced_code_blocks => true, :gh_blockcode => true}
			redcarpet = Redcarpet::Markdown.new(renderer, extensions)
			self.body = redcarpet.render self.body_input
			self.preview = redcarpet.render self.preview_input
		end
end

class PygmentizeHTML < Redcarpet::Render::HTML
	def block_code(code, language)
		require 'pygments'
		Pygments.highlight(code, lexer: language.to_sym, options: {lineanchors: 'line'})
	end
end
