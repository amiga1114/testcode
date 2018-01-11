### 1. 테스트코드 작성하기

> app/models/post.rb 수정하기
>
> ```
> class Post < ActiveRecord::Base
>  validates :title, presence: true,
>                    length: { minimun: 2 }
>  # validates :content
> end
>
> ```
>
> test/models/post_test.rb 수정하기
>
> 1. assert 사용 => 미리 작성된 코드를 테스트할 때 주로 사용
>
> ```
> class PostTest < ActiveSupport::TestCase
>  # test "the truth" do
>  #   assert true
>  # end
>  test "Post의 타이틀은 두 글자 이상이어야 한다" do
>    post = Post.new(title: "ad")
>    assert post.save # 참이되는 조건
>  end
> end
> ```
>
> 1. refute 사용 => 미리 작성된 코드가 아닌 테스트에서 코드를 작성하며 시작할 때 주로 사용
>
> ```
> test "Post의 타이틀은 nil이 아니어야 한다." do
>    post = Post.new(title: "")
>    refute post.save
>  end
>
>  test "title은 반드시 2글자 이상이어야 한다." do
>    post = Post.new(title: "a")
>    refute post.save
>  end
>
>  test "title은 반드시 100글자 이하이어야 한다." do
>    post = Post.new(title: Faker::Lorem.words(200))
>    refute post.save
>  end	
> ```
>
> 실행하기
>
> ```
> $ rake test:models
> ```