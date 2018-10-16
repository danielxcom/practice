class UsersController < ApplicationController
# CRUD : controllers and actions do them.
# resources <- controller manages its requests.

  def show
    @user = User.new(params[:id])
    render json: params
  end
  def index
    @user = User.all

    render json: params

  end

# params is method provided by ActionController::Base
# - route params (:id from /users/:id)
# - query string (?: ?key=value)
# - POST/PATCH request data (the body of the HTTP req)

# if we don't explicitly render or redirect, Rails is going to try to render the template with the same name; it's going to look for create.html.erb
#   in our app/views/users folder, which we don't have.

#   def create
#     #render json calls to_json on obj we're rendering.
#     # render json: params
#
#     user = User.new(params.require(:user).permit(:name, :email))
#     user.save! # save! brings up a deep error.
#
#     save! the validation will fail and an error will be raised.
#
# # To inform the user of what went wrong, it is typical to send back
# # error messages. Let's modify our controller code to send back
# # the errors as JSON in the event of failure:
#     render json: user
#
#     # user params under :user leverages
#   end

  def create
    user = User.new(helper_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end
  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
  end

  def delete
    user = User.find(params[:id])

    if user.destroy
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

private
# refactored.
  def helper_params
    params.require(:user).permit(:name, :email)
  end
end
