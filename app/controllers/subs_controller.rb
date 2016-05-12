# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SubsController < ApplicationController
  def create
    suub = Sub.new(sub_params, moderator_id: current_user.id)

    if suub && suub.save
      redirect_to sub_url(suub)
    else
      flash[:notice] = "Your sub idea sucks"
      redirect_to new_sub_url
    end
  end

  def show
    @suub = Sub.find_by_id(params[:id])

    if @suub
      render :show
    else
      flash[:notice] = "We couldn't find your stupid sub"
      redirect_to subs_url
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def edit
    @sub = Sub.find_by_id(params[:id])
    render :edit
  end

  def new
    @sub = Sub.new
    render :new
  end

  def update
    suub = Sub.find_by_id(params[:id])

    if suub && suub.update(sub_params)
      redirect_to sub_url(suub)
    else
      flash[:notice] = "Learn to eEdit"
      redirect_to edit_sub_url(suub)
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
