class SitemapController < ApplicationController
  layout nil

  def index
    headers['Content-Type'] = 'application/xml'
    @codes = Code.find(:all, :order => "created_at DESC")
    @tools = Tool.find(:all, :order => "created_at DESC")
  end
end