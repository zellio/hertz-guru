require 'sinatra/base'

class HertzGuru < Sinatra::Base
  VALID_WAVE_TYPES = ['sine', 'square', 'sawtooth', 'triangle']

  set :public_folder, 'assets'
  set :views, 'templates'
  set :erb, layout: :base

  get '/' do
    redirect to("/440"), 302
  end

  get '/:hz' do
    redirect to("/sine/#{params[:hz]}"), 302
  end

  get '/:type/:hz' do
    unless VALID_WAVE_TYPES.include? params[:type]
      redirect to("/sine/#{params[:hz]}"), 302
    end

    unless params[:hz].to_i.to_s == params[:hz]
      redirect to("/#{params[:type]}/440"), 302
    end

    erb :index, locals: params
  end
end
