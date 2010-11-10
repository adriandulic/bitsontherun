BitsOnTheRun
==============

BitsOnTheRun is an implementation of [bitsontherun.com](bitsontherun.com) API in Ruby.

## Install

Gemfile:

    gem 'bitsontherun', :git => 'http://github.com/adriandulic/bitsontherun.git'

Setup:

    BitsOnTheRun::Configuration.key = "your api key"
    BitsOnTheRun::Configuration.secret = "your api secret"

## Usage

Basic:

    BitsOnTheRun::call('version') => {:status => "ok", :version => "X.X.X"}
    
    BitsOnTheRun::store('videos/create', 'video.mp4') => {:status => "ok", ...}
    
    BitsOnTheRun::call('videos/update', :video_key => 'your video key', :title => 'New title for video').ok? => true

Extended:

    call = BitsOnTheRun::API.new(:call)
    call.method('videos/list')
    call.execute
    
    call = BitsOnTheRun::API.new(:call)
    call.method('videos/show', :video_key => 'your video key')
    call.execute
    
    call = BitsOnTheRun::API.new(:call)
    call.method('videos/update', :video_key => 'your video key', :title => 'New title for video')
    call.execute
    
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
