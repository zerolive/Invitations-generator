require 'sinatra'
require './helpers/creates.rb'

createoption = CreateSelect.new
createimgsamples = CreatePreview.new

#host heroku "https://boiling-wildwood-6801.herokuapp.com"
#host local "http://localhost:9393"
host = "https://boiling-wildwood-6801.herokuapp.com"

get '/' do
  @title = 'Create your own invitation'
  @selectmaker = createoption.makeselectoptions
  @sampleimg = createimgsamples.createtable
  erb :home
end

post '/' do
	@title = 'Preview of you invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
	@template = params[:template]
	@link = host
    erb :preview
end

get '/:template/:owner/:event/:place/:date' do
	@title = 'Preview of you invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
    @template = params[:template]
    @link = host
	erb :preview
end

get '/:template/:owner/:event/:place/:date/edit' do
	@title = 'Editing your invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
    @template = params[:template]
    @selectmaker = createoption.makeselectoptions
    @sampleimg = createimgsamples.createtable
	erb :edit
end

not_found do
	@title = 'Create your own invitation'
    erb :home
end