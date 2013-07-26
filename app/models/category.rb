class Category < ActiveRecord::Base
	attr_accessible :name, :url
	has_many :codes
	def to_param
		url
	end
	def before_save
		url = url.downcase
	end
end
ActiveAdmin.register Category, :as => "Code Categories"