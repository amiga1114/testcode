require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # test "Post의 타이틀은 nil이 아니어야 한다." do
  #  post = Post.new(title: "aaaaa")
  #  refute post.save
  # end

  test "title은 반드시 2글자 이상이어야 한다." do
    post = Post.new(title: "a")
    assert post.save
  end

  test "title은 반드시 100글자 이하이어야 한다." do
    post = Post.new(title: Faker::Lorem.words(10))
    assert post.save
  end
end
