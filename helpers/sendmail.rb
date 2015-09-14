Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => 'app41161843@heroku.com',
    :password => 'z5tinsm73667',
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

class EmailSend
	def email_sender (templateurl, owner, event, place, date, email)
		Mail.deliver do
		  to email.to_s
		  from 'invitation@generator.com'
		  subject 'You was invited to ' + event.to_s
		  html_part do
      	    content_type 'text/html; charset=UTF-8'
      	    body '
				<table width="500" height="275" background="' + templateurl.to_s + '">
					<tr>
						<td>
							<center>
							<h2>' + templateurl.to_s + '</h2>
							<h1>' + owner.to_s + '</h1>
							<h2>invites you to</h2>
							<h1>' + event.to_s + '</h1>
							<h2>The party will be in</h2>
							<h1>' + place.to_s + '</h1>
							<h1>' + date.to_s + '</h1>
							</center>
						</td>
					</tr>
				</table>
			'
    	  end
		end
	end
end