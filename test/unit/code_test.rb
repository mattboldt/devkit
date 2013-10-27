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

require 'test_helper'

class CodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
