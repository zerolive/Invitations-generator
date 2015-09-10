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