# BitsOnTheRun

BitsOnTheRun is a wrapper on bitsontherun.com API written in Ruby.

## Usage

Basic usage:

    BitsOnTheRun::call('version') => {:status => "ok", :version => "X.X.X"}
    BitsOnTheRun::store('video/create', 'video.mp4') => {:status => "ok", ...}

    r.find(:account, :cdn, :name).should be_instance_of String
    r.find([:account, :cdn, :name]).should be_instance_of String
    r.find(:account, [:cdn, :name]).should be_instance_of String
    r.account(:cdn, :name).should be_instance_of String
    r.account([:cdn, :name]).should be_instance_of String
    r.account.cdn(:name).should be_instance_of String
    r.account.cdn.name.should be_instance_of String
