class PostsController < ApplicationController
  #regarder dans application_controller (part 5 method au comemence de l app)
   before_filter :set_posts, only: [:index]

  def index
  end


  def show
  end

  def new
    @resource = Post.new
  end


  def update
    if @resource.update_attributes(params[:post])
      redirect_to(posts_path, :notice => "Post was success updated")
    else
       render :action => "edit"
    end
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to posts_path, :notice => "Your post was saved"
    else
      render "new"
    end
  end

  def edit
  end

  def destroy
    @resource.destroy
    redirect_to posts_url
  end

  protected

  def set_resource
    @resource ||= Post.find(params[:id])
  end

  def set_posts
    @posts ||=  Post.all
    if params[:important].present?
      @posts = Post.where(important: (params[:important] == 'true'))
    end
  end

end
