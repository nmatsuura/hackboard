require 'test_helper'

class PostTest < ActiveSupport::TestCase

	def valid_attributes
		{ description: "Test", link: "http://www.google.com" }
	end

	test "posts without users should not be valid" do
		p = Post.new(valid_attributes)
		p.user = nil
		#assert_false p.valid?
		assert_equal false, p.valid?
	end

	test "posts with users should be valid" do
		p = Post.new(valid_attributes)
		p.user = User.new
		assert p.valid?, p.errors.full_messages.join(", ")
	end
  # test "the truth" do
  #   assert true
  # end
end
