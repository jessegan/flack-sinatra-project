class UserController < ApplicationController

    get '/login' do
        erb :'users/login'
    end

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user && user.save
            session[:user_id] = user.id
            redirect to '/groups'
        else
            redirect to '/signup'
        end
    end

end