class PostsController < ApplicationController
  before_action :private_acces, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
    @posts = @posts.where("title LIKE :title", title: "%#{params[:title]}%")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "El post fue publicado con exito"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "El POST ha sido modificado con exito"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "El POST fue eliminado!"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
