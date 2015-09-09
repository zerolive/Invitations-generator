require 'sinatra'

get '/' do
  @title = 'Create your own invitation'
  erb :home
end

post '/' do
	@title = 'Preview of you invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
	@template = params[:template]
    erb :preview
end

get '/:template/:owner/:event/:place/:date' do
	@title = 'Preview of you invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
    @template = params[:template]
	erb :preview
end

get '/:template/:owner/:event/:place/:date/edit' do
	@title = 'Editing your invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
    @template = params[:template]
	erb :edit
end

not_found do
	@title = 'Create your own invitation'
    erb :home
end