require './config/environment'

use Rack::MethodOverride

use UserController
use GroupController
use ChannelController
run ApplicationController
