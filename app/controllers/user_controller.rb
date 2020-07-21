class UserController < ApplicationController

    get '/login' do
        if logged_in?
            redirect to '/groups'
        else 
            erb :'users/login'
        end
    end

    get '/signup' do
        if logged_in?
            redirect to '/groups'
        else 
            erb :'users/signup'
        end
    end

    get '/profile' do
        if logged_in?
            @user = current_user
            @group_count = @user.groups.count
            @most_active = Channel.find(@user.messages.group(:channel_id).count.max_by{|k,v|v}[0])

            erb :'users/profile'
        else
            redirect to "/login"
        end
    end

    get '/profile/edit' do
        if logged_in?
            @user = current_user

            erb :'users/edit'
        else
            redirect to "/login"
        end
    end

    get '/invites' do
        if logged_in?
            @invites = Request.where(user:current_user,request_type:'invite',status:'pending')

            erb :'users/invites'
        else
            redirect to "/login"
        end
    end

    post '/request' do
        group = Group.find(params[:group_id])

        Request.create(user:current_user,group:group,request_type:"join")

        redirect to '/groups/list'
    end

    post '/invites' do
        invite = Request.find(params[:invite_id])

        if params[:action] == 'Accept'
            invite.update(status: 'accepted')

            invite.group.users << invite.user
        else
            invite.update(status: 'declined')
        end

        redirect to "/invites"
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

    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id

            redirect to '/groups'
        else 
            redirect to '/login'
        end
    end

    patch '/profile' do
        user = current_user
        if user.update(params[:user])
            redirect to '/profile'
        else 
            redirect to '/profile/edit'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
        end
        
        redirect to '/login'
    end

end