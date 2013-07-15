class SessionsController < ApplicationController
  # GET (sign in - new session page)
  def new
  end

  # POST (create a new session)
  def create
    user = User.find_by_email(params[:session][:email])
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        # user.api_keys.create!
        sign_in user # create cookie
        format.json { render json: user, status: :created, location: user }
        format.html { redirect_back_or user }
      else
        flash.now[:error] = 'Invalid email/password combination.'
        render 'new'
      end
    end
  end

  # DELETE (sign out - delete session)
  def destroy
    sign_out
    redirect_to root_path
  end
end
