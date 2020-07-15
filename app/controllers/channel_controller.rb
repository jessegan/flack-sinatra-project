class ChannelController < ApplicationController

    get '/groups/:slug/c/:channel_slug' do
        @group = Group.find_by_slug(params[:slug])
        @channel = Channel.find_by_slug(params[:channel_slug])
        @user = current_user

        erb :'channels/view'
    end

end