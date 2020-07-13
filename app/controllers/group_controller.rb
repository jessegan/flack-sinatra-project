class GroupController < ApplicationController

    get '/groups' do
        erb :'groups/index'
    end
    
end