class UserController < ApplicationController

    get '/users/login' do
        erb :'users/login'
    end

    get '/users/signup' do
        erb :'users/signup'
    end

end