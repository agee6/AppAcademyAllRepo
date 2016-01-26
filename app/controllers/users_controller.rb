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
    end
  end

  def show
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
    params[:user].require(:username)
  end
end
