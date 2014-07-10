class PostsController < ApplicationController

	def new
	  @post = @blog.new_post
	end
	def create
      @post = @blog.new_post(post_params)
      # @post = @blog.new_post(params[:post])
      @post.publish
      redirect_to root_path, notice: "Post added!"
	end

  private
  def post_params
    params.require(:post).permit(:title, :body, :blog)
  end
end