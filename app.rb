require 'sinatra'
require 'mail'
require 'net/smtp'
require './helpers/creates.rb'
require './helpers/sendmail.rb'

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
	@base_url = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}/#{@template}/#{@owner}/#{@event}/#{@place}/#{@date}"
    erb :preview
end

get '/:template/:owner/:event/:place/:date' do
	@title = 'Preview of you invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
    @template = params[:template]
    @base_url = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}/#{@template}/#{@owner}/#{@event}/#{@place}/#{@date}"
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

get '/:template/:owner/:event/:place/:date/sendmail' do
	@title = 'Send your invitation'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
    @template = params[:template]
    @base_url = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}/#{@template}/#{@owner}/#{@event}/#{@place}/#{@date}"
	erb :sendmail
end

post '/:template/:owner/:event/:place/:date/sent' do
	@title = 'Invitation was sent'
	@owner = params[:owner]
	@event = params[:event]
	@place = params[:place]
	@date = params[:date]
    @template = params[:template]
    @email = params[:email]
    @base_url = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}/#{@template}/#{@owner}/#{@event}/#{@place}/#{@date}"
    @template_url = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}/img/#{@template}.jpg"
    newemail = EmailSend.new
    newemail.email_sender(@template_url, @owner, @event, @place, @date, @email)
	erb :sent
end

not_found do
	@title = 'Create your own invitation'
	@selectmaker = CreateSelect.make_select_options
	@sampleimg = CreatePreview.create_table
    erb :home
end