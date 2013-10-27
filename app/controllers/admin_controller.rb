class AdminController < ApplicationController
  layout "admin"
  @codes = Code.all
  @tools = DevTool.all
  @blog_posts = BlogPost.all
end