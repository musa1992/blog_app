require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: "Tests", body: "This is the body", author: "Am the scribe")
  end
  test "title should be present" do 
    @post.title = " "
    assert_not @post.valid?
  end

  test "body should be present" do
    @post.body = " "
    assert_not @post.valid?
  end

  test "author should be present" do
    @post.author = " "
    assert_not @post.valid?
  end
  test "title should not be too long" do
    @post.title = 'a'* 71
    assert_not @post.valid?
  end

  test "author should not be too long" do
    @post.author = 'a' * 31
    assert_not @post.valid?
  end

  test "body should not be too short" do
    @post.body = Array.new(9,"blog").join(" ")
    assert_not @post.valid?
  end
end
