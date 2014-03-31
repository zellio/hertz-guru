require 'sinatra'
require 'sass/plugin/rack'
require 'rack/coffee'
require './app'

Sass::Plugin.options.merge!(
  style: :expanded,
  template_location: { 'assets/sass' => 'assets/css' }
)
use Sass::Plugin::Rack

use Rack::Coffee, root: 'assets', urls: '/js'

run HertzGuru
