require 'sinatra'

# VALID_WAVE_TYPES = ['sine', 'square', 'sawtooth', 'triangle']

get '/' do
  redirect to("/440"), 302
end

get '/:hz' do
  redirect to("/sine/#{params[:hz]}"), 302
end

get '/:type/:hz' do
  unless ['sine', 'square', 'sawtooth', 'triangle'].include? param[:type]
    redirect to("/sine/#{params[:hz]}"), 302
  end

  unless params[:hz].to_i.to_s == params[:hz]
    redirect to("/#{params[:type]}/440"), 302
  end

  erb :"index.html", locals: params
end
