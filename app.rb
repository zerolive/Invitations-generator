require 'sinatra'

class CreateSelect
	def makeselectoptions 
		filename = Dir.glob("./public/img/*.jpg")
		filename.each do |x|
			x.slice!("./public/img/")
			x.slice!(".jpg")
		end
		selectoption = ""
		filename.each do |x|
			selectoption = selectoption + "<option value=\"#{x}\">#{x.capitalize}</option>"
		end
		selectoption = "<select name=\"template\" id=\"select\">" + selectoption + "</select>"
		return selectoption
	end
end

class CreatePreview
	def createtable
		filename = Dir.glob("./public/img/*.jpg")
		filename.each do |x|
			x.slice!("./public/img/")
			x.slice!(".jpg")
		end
		urlname = Dir.glob("./public/img/*.jpg")
		urlname.each do |x|
			x.slice!("./public")
		end
		htmlcode = "<center><table class=\"\"><tr>"
		filename.each do |x|
			htmlcode = htmlcode + "<td align=\"center\">#{x.capitalize}</td>"
		end
		htmlcode = htmlcode + "</tr><tr>"
		urlname.each do |x|
			htmlcode = htmlcode + "<td><img src=\"#{x}\" width=\"100\" height=\"50\" ></td>"
		end
		htmlcode = htmlcode + "</tr></table></center>"
		return htmlcode
	end
end

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