class PostsController < ApplicationController
  #regarder dans application_controller (part 5 method au comemence de l app)
   before_filter :set_posting, only: [:index]

   def set_posting
     raiser "you must overwrite"
   end

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

  def set_posting
    @posting ||=  Post.all
  end

end
