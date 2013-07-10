class SessionsController < ApplicationController
  # GET (sign in - new session page)
  def new
  end
  
  # POST (create a new session)
  def create
  	render 'new'
  end
  
  # DELETE (sign out - delete session)
  def destroy
  end
end
