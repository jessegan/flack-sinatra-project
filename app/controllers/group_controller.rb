class GroupController < ApplicationController

    get '/groups' do
        if !logged_in?
            redirect to '/login'
        else 
            @user = current_user

            erb :'groups/index'
        end
    end

    get '/groups/new' do
        if !logged_in?
            redirect to '/login'
        else
            @user = current_user

            erb :'groups/new'
        end
    end

    post '/groups' do
        group = Group.new(params)
        group.users << current_user
        if group.save
            redirect to '/groups'
        else
            redirect to '/groups/new'
        end
    end
    
end