<<<<<<< HEAD
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
=======
class UsersController < ApplicationController
  def index
    # render text: "I'm in the index action!"
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
>>>>>>> df507360b6b87b8b4b69fe0523f2dca32d06e03e
    end
  end

  def show
<<<<<<< HEAD
    @user = User.find_by_id(params[:id])
    render :show
  end

=======
    render json: User.find_by_id(params[:id])
  end

  def update
    user = User.find_by_id(params[:id])
    if user.update!(user_params)
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user.destroy
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
>>>>>>> df507360b6b87b8b4b69fe0523f2dca32d06e03e
end
