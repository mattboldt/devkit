class AdminController < ApplicationController   
  layout "admin" 
end

class Admin::PostController < AdminController 
end