class PostsController < ApplicationController
    before_action :get_post, only: [:show, :edit, :update, :destroy]
	def index
      @posts = Post.all		
	end

	def new
      @post = Post.new
	end

	def create	
      @post = Post.new(post_params)
      @post.save
      redirect_to posts_path, notice: 'Post is successfully created'
    end

    def show
    end

    def edit
    end

    def update
     @post.update(post_params)
     redirect_to posts_path
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

 private
   
   def post_params
     params.require(:post).permit(:name, :description)
   end

   def get_post
    @post = Post.find(params[:id])
   end

end
