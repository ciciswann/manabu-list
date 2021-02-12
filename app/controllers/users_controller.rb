class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            erb :"/users/dashboard"
        else
            erb :"/users/signup"
        end
    end

    post '/signup' do
        user = User.create(params["user"])
        if user.valid?
            flash[:success] = "Successfully created account"
            session["user_id"] = user.id
            redirect "/users/dashboard"
        else
            flash[:error] = user.errors.full_messages.first
            redirect '/signup'
        end
    end
end