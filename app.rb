require 'sinatra'

class CreateSelect
	def makeselectoptions 
		filename = Dir.glob("./public/img/*.jpg")
		filename.each do |x|
			x.slice!("./public/img/")
			x.slice!(".jpg")
			"<option value=\"#{x}\">#{x.capitalize}</option>"
		end
		selectoption = ""
		filename.each do |x|
			selectoption = selectoption + "<option value=\"#{x}\">#{x.capitalize}</option>"
		end
		return selectoption
	end
end
createoption = CreateSelect.new

#host heroku https://boiling-wildwood-6801.herokuapp.com
#host local http://localhost:9393
host = "https://boiling-wildwood-6801.herokuapp.com"

get '/' do
  @title = 'Create your own invitation'
  @selectmaker = createoption.makeselectoptions
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
	erb :edit
end

not_found do
	@title = 'Create your own invitation'
    erb :home
end