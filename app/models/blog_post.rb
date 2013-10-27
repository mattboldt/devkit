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
end
