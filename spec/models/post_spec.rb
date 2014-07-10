class Post
  module ActiveModel
    module Naming; end
    module Conversion; end
  end
  require 'minitest/autorun'
  require_relative '../../app/models/post'
  
  describe Post do
    subject { Post.new }

    it "starts with blank attributes" do
      subject.title.must_be_nil
      subject.body.must_be_nil	
    end

    it "support reading and writing title" do
      subject.title = "foo"
      subject.title.must_equal "foo"	
    end

    it "support reading and writing body" do
      subject.body = "foo"
      subject.body.must_equal "foo"	
    end

    it "supports reading and writing a blog reference" do
      blog = Object.new
      subject.blog = blog
      subject.blog.must_equal blog	
    end

    describe "#publish" do
      before do
 	    @blog = MiniTest::Mock.new
 	    subject.blog = @blog
	  end

	  after do
	  	@blog.verify
	  end

	  it "adds the post to the blog" do
	  	@blog.expect :add_entry, nil, [subject]
	  	subject.publish
	  end
    end

    it "supports setting attributes in the initializer" do
      it = Post.new(title: "mytitle", body: "mybody")
      it.title.must_equal "mytitle"
      it.body.must_equal "mybody"
    end
  end


end