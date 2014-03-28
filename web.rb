require 'sinatra'

get '/' do
  redirect to("/440"), 302
end

get '/:freq' do

  redirect to("/sin/#{params[:freq]}"), 302
end

get '/:type/:freq' do
  wave_types = [:sin, :square, :sawtooth, :triangle]
  type = params[:type].to_sym

  redirect to ("/sin/#{params[:freq]}"), 302 unless wave_types.include?(type)


  erb :"index.html", locals: { wave_type: wave_types.index(type), hz_val: params[:freq] }

end
