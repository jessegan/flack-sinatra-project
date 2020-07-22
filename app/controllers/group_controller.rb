class GroupController < ApplicationController

    get '/groups' do
        if @logged_in = logged_in?
            @user = current_user
            @groups = @user.groups.sort_by {|x| x.display_name}

            erb :'groups/index'
        else 
            redirect to '/login'
        end
    end

    get '/groups/new' do
        if @logged_in = logged_in?
            @user = current_user

            erb :'groups/new'   
        else
            redirect to '/login'
        end
    end

    get '/groups/list' do
        if @logged_in = logged_in?
            other_groups = Group.all.reject {|g| g.users.include?(current_user)}

            @requested_groups = Request.where(user: current_user,request_type:'join',status: 'pending').map {|x| x.group}
            @public_groups = other_groups.select {|g| g.public?}.sort_by {|g| g.display_name}
            @private_groups = other_groups.select {|g| !g.public?}.sort_by {|g| g.display_name}

            erb :'groups/list'
        else
            redirect to '/login'
        end
    end

    get '/groups/:slug' do
        if @logged_in = logged_in?
            @group = Group.find_by_slug(params[:slug])
            @user = current_user
            @groups = @user.groups.sort_by {|x| x.display_name}
            @channels = @group.channels.sort_by {|x| x.name}
            @is_admin = admin?(@group)
            erb :'groups/view'
        else
            redirect to '/login'
        end
    end

    get '/groups/:slug/members' do
        if @logged_in = logged_in?
            @group = Group.find_by_slug(params[:slug])
            @members = @group.group_users.sort_by {|x| x.user.name}
            @is_admin = admin?(@group)
    
            erb :'groups/members'
        else
            redirect to '/login'
        end
    end

    get '/groups/:slug/members/edit' do
        if @logged_in = logged_in?
            @group = Group.find_by_slug(params[:slug])
            if admin?(@group)
                erb :'groups/edit_members'
            else
                redirect "/groups/#{@group.slug}"
            end
        else
            redirect to '/login'
        end
    end

    get '/groups/:slug/invite' do
        if @logged_in = logged_in?
            @group = Group.find_by_slug(params[:slug])
            if admin?(@group)
                @other_users = User.all.reject {|user| @group.users.include?(user)}.sort_by {|x| x.name}
                @invites_sent = @group.requests.where(request_type:'invite',status:'pending').map{|x|x.user}
    
                erb :'groups/invite'
            else
                redirect "/groups/#{@group.slug}"
            end
        else
            redirect to '/login'
        end
    end

    get '/groups/:slug/edit' do
        if @logged_in = logged_in?
            @group = Group.find_by_slug(params[:slug])
            if admin?(@group)
                @user = current_user
                @members = @group.group_users.sort_by {|m| m.user.name}
            
                erb :'groups/edit'
            else
                redirect "/groups/#{@group.slug}"
            end
        else
            redirect to '/login'
        end
    end

    get '/groups/:slug/requests' do
        if @logged_in = logged_in?
            @group = Group.find_by_slug(params[:slug])
            if admin?(@group)
                @requests = @group.requests.where(request_type: "join",status: 'pending')
            
                erb :'groups/requests'
            else
                redirect "/groups/#{@group.slug}"
            end
        else
            redirect to '/login'
        end
    end

    post '/groups' do
        group = Group.new(params)
        if group.save
            group.group_users.create(user: current_user, admin: 1)
            group.channels.create(name:'general')

            redirect to '/groups'
        else
            redirect to '/groups/new'
        end
    end

    post '/groups/:slug/join' do
        group = Group.find_by_slug(params[:slug])
        
        group.users << current_user

        redirect to '/groups'
    end

    post '/groups/:slug/requests' do
        request = Request.find(params[:request_id])
        group = Group.find_by_slug(params[:slug])

        if params[:action] == 'Accept'
            request.update(status: 'accepted')

            group.users << request.user
        else
            request.update(status: 'declined')
        end

        redirect to "/groups/#{group.slug}/requests"
    end

    post '/groups/:slug/invite' do
        group = Group.find_by_slug(params[:slug])
        user = User.find(params[:user_id])

        Request.create(user:user,group:group,request_type:'invite')

        redirect to "/groups/#{group.slug}/invite"
    end

    post '/groups/:slug/leave' do
        group = Group.find_by_slug(params[:slug])

        group.users.delete(current_user)

        redirect to "/groups"
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