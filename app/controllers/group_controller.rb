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
        @is_admin = @group.group_users.find_by(user: @user).admin

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
        @members = @group.group_users.sort_by {|m| m.user.name}

        erb :'groups/edit'
    end

    patch '/groups/:slug' do
        group = Group.find_by_slug(params[:slug])

        group.update(params[:group])

        if params[:admins]
            group.group_users.update_all(admin: false)
            group.group_users.where(id:params[:admins]).update_all(admin:true)
        end

        redirect to "/groups/#{group.slug}"
    end

    delete '/groups/:slug' do
        group = Group.find_by_slug(params[:slug])
        group.destroy

        redirect to '/groups'
    end

end