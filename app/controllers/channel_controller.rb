class ChannelController < ApplicationController

    get '/groups/:slug/c/new' do
        @group = Group.find_by_slug(params[:slug])

        erb :'channels/new'
    end

    get '/groups/:slug/c/:channel_slug' do
        @group = Group.find_by_slug(params[:slug])
        @channel = Channel.find_by_slug(params[:slug],params[:channel_slug])
        @user = current_user
        @is_admin = admin?(@group)

        erb :'channels/view'
    end

    get '/groups/:slug/c/:channel_slug/edit' do
        @group = Group.find_by_slug(params[:slug])

        if admin?(@group)
            @channel = Channel.find_by_slug(params[:slug],params[:channel_slug])
            @user = current_user

            erb :'channels/edit'
        else
            redirect "/groups/#{params[:slug]}/c/#{params[:channel_slug]}"
        end

    end

    post '/groups/:slug/c/:channel_slug' do
        group = Group.find_by_slug(params[:slug])
        channel = Channel.find_by_slug(params[:slug],params[:channel_slug])

        Message.create(params[:message])

        redirect to "/groups/#{group.slug}/c/#{channel.slug}"
    end

    post '/groups/:slug/c' do
        group = Group.find_by_slug(params[:slug])
        channel = Channel.new(params[:channel])

        if channel.save
            redirect to "/groups/#{group.slug}"
        else
            redirect to "/groups/#{group.slug}/c/new"
        end

    end

    patch '/groups/:slug/c/:channel_slug' do
        group = Group.find_by_slug(params[:slug])
        channel = Channel.find_by_slug(params[:slug],params[:channel_slug])

        if channel.update(params[:channel])
            redirect to "/groups/#{group.slug}/c/#{channel.slug}"
        else
            channel = Channel.find_by_slug(params[:slug],params[:channel_slug])
            redirect to "/groups/#{group.slug}/c/#{channel.slug}/edit"
        end        
    end

    delete '/groups/:slug/c/:channel_slug' do
        group = Group.find_by_slug(params[:slug])
        channel = Channel.find_by_slug(params[:slug],params[:channel_slug])
        channel.destroy

        redirect to "/groups/#{group.slug}"
    end

end