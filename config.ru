require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require 'sinatra/simple-navigation'
require File.join(File.dirname(__FILE__),'lib','partials')
require File.join(File.dirname(__FILE__),'main')
run Main
