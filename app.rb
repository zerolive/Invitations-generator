require 'sinatra'
require './helpers/creates.rb'

get '/' do
  @title = 'Create your own invitation'
  @selectmaker = CreateSelect.make_select_options
  @sampleimg = CreatePreview.create_table
  erb :home
end

post '/' do
	@title = 'Preview of you invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
	@template = params[:template]
	@base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    erb :preview
end

get '/:template/:owner/:event/:place/:date' do
	@title = 'Preview of you invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
    @template = params[:template]
    @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
	erb :preview
end

get '/:template/:owner/:event/:place/:date/edit' do
	@title = 'Editing your invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
    @template = params[:template]
    @selectmaker = CreateSelect.make_select_options
    @sampleimg = CreatePreview.create_table
	erb :edit
end

not_found do
	@title = 'Create your own invitation'
	@selectmaker = CreateSelect.make_select_options
	@sampleimg = CreatePreview.create_table
    erb :home
end