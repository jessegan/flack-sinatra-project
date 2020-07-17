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
            GroupUser.create(group: group, user: current_user, admin: 1)

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

    get '/groups/:slug/members' do
        @group = Group.find_by_slug(params[:slug])
        @other_users = User.all.reject {|user| @group.users.include?(user)}

        erb :'groups/members'
    end

    get '/groups/:slug/edit' do
        @user = current_user
        @group = Group.find_by_slug(params[:slug])
        @members = @group.group_users.reject{|m| m.user==@user}.sort_by {|m| m.user.name}

        erb :'groups/edit'
    end

    patch '/groups/:slug' do
        group = Group.find_by_slug(params[:slug])

        group.update(params[:group])

        redirect to "/groups/#{group.slug}"
    end

    delete '/groups/:slug' do
        group = Group.find_by_slug(params[:slug])
        group.destroy

        redirect to '/groups'
    end

end