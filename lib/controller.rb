# frozen_string_literal: true

require 'gossip'

# class used to call each erb file and generate an html page
class ApplicationController < Sinatra::Base
  attr_accessor :id

  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end

  get '/gossips/:id/' do
    @id = params[:id]
    erb :show
  end
end
