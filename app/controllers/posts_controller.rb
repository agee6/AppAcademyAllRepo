# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    if post && post.save
      redirect_to post_url(post)
    else
      flash[:notice] = "Silly post, try again"
      redirect_to new_post_url
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    if @post
      render :show
    else
      redirect_to subs_url
    end
  end

  def update
    post = Post.find_by_id(params[:id])
    if post && post.update(post_params)
      redirect_to post_url(post)
    else
      flash[:notice] = "You are a horrible person"
      redirect_to edit_post_url
    end
    
  end
  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
  end
end
