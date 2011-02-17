BitsOnTheRun
============

BitsOnTheRun is an implementation of [bitsontherun.com](http://bitsontherun.com) API in Ruby.

## Install

Just run the following command:

    gem install bitsontherun

Then in your Gemfile add the following line:

    gem 'bitsontherun'

And finally run:

    bundle install

For rails app create the _config/initializers/bitsontherun.rb_ file:

    # Bitsonthrun configuration
    BitsOnTheRun.key = "your api key"
    BitsOnTheRun.secret = "your api secret"

## Usage

Basic call:

    BitsOnTheRun::call('version') => {:status => "ok", :version => "X.X.X"}
    BitsOnTheRun::call('videos/update', :video_key => 'your video key', :title => 'New title for video').ok? => true

Basic store (upload a video):

    BitsOnTheRun::store('videos/create', 'video.mp4') => {:status => "ok", ...}

Basic store (create a new video object on the plaform and generate upload url):

    BitsOnTheRun::call('videos/create').upload_url => http://upload.bitsontherun.com/v1/videos/upload?api_format=json&key=<key>&token=<token>

Extended call methods:

    call = BitsOnTheRun::API.new(:call)
    call.method('videos/list')
    call.execute
    
    call = BitsOnTheRun::API.new(:call)
    call.method('videos/show', :video_key => 'your video key')
    call.execute
    
    call = BitsOnTheRun::API.new(:call)
    call.method('videos/update', :video_key => 'your video key', :title => 'New title for video')
    call.execute
    
Extended store methods:

    call = BitsOnTheRun::API.new(:store)
    call.method('videos/create')
    call.file('video.mp4')
    call.execute

## How to navigate through response

Request:

    BitsOnTheRun::call('accounts/show')

Response:

    {:account => {:cdn => {:name => "Value" }}}

Find methods:

    response.account.cdn.name => "Value"
    response.account.cdn(:name) => "Value"
    response.account(:cdn, :name) => "Value"
    response.account([:cdn, :name]) => "Value"
    response.find(:account, :cdn, :name) => "Value"
    response.find([:account, :cdn, :name]) => "Value"


Request:

    BitsOnTheRun::call('videos/list')

Response:

    {:videos => [{ video }, { ... }, ...]}

Find methods:

    response.videos => [<BitsOnTheRun::Response>, <BitsOnTheRun::Response>, ...]
    response.videos.first => <BitsOnTheRun::Response>
    repsonse.videos.first.title => "Video title"
