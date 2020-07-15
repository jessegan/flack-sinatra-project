class ChannelController < ApplicationController

    get '/groups/:slug/c/:id' do
        @group = Group.find_by_slug(params[:slug])
        @channel = Channel.find(params[:id])
        @user = current_user

        erb :'channels/view'
    end

end