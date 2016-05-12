# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UsersController < ApplicationController


  def create
    @user = User.new(user_params)
    if @user && @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:notice] = "Couldn't create user"
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

end
