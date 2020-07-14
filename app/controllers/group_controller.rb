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
        if group.save
            group.users << current_user

            redirect to '/groups'
        else
            redirect to '/groups/new'
        end
    end

    get '/groups/:slug' do
        @group = Group.find_by_slug(params[:slug])
        @user = current_user

        erb :'groups/view'
    end


end