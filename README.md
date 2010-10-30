# BitsOnTheRun

BitsOnTheRun is a wrapper on bitsontherun.com API written in Ruby.

## Usage

Basic usage:

	BitsOnTheRun::API.call('version') => {:status => "ok", :version => "X.X.X"}
	BitsOnTheRun::API.upload('video.mp4') => {:status => "ok", ...}
