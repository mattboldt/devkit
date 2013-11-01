# == Schema Information
#
# Table name: blog_posts
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  slug         :string(255)
#  desc         :text
#  body         :text
#  history_flag :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class BlogPost < ActiveRecord::Base
	require 'nokogiri'
	before_save :render_body, :defaults
	acts_as_taggable
	validates :title, presence: true
	validates :slug, presence: true
	validates :desc, presence: true
	validates :body_input, presence: true
	validates :history_flag, presence: true
	validates :tag_list, presence: true

	custom_slugs_with(:slug)


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
