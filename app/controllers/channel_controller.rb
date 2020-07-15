class ChannelController < ApplicationController

    get '/groups/:slug/c/new' do
        @group = Group.find_by_slug(params[:slug])

        erb :'channels/new'
    end

    get '/groups/:slug/c/:channel_slug' do
        @group = Group.find_by_slug(params[:slug])
        @channel = Channel.find_by_slug(params[:channel_slug])
        @user = current_user

        erb :'channels/view'
    end

    post '/groups/:slug/c/:channel_slug' do
        group = Group.find_by_slug(params[:slug])
        channel = Channel.find_by_slug(params[:channel_slug])

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

end