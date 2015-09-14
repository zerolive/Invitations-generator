class CreateSelect
	def self.make_select_options 
		filenames = obtain_background_names
		return generate_select(filenames)
	end

	private

	def self.obtain_background_names
		filename = Dir.glob("./public/img/*.jpg")
		filename.each do |name|
			name.slice!("./public/img/")
			name.slice!(".jpg")
		end
		filename
	end
	def self.generate_select names
		htmlcode = ""
		names.each do |name|
			htmlcode = htmlcode + "<option value=\"#{name}\">#{name.capitalize}</option>"
		end
		htmlcode = "<select name=\"template\" id=\"select\">" + htmlcode + "</select>"
		return htmlcode
	end
end

class CreatePreview
	def self.create_table
		filesnames = generate_files_names
		urlsnames = generate_urls_names

		htmlcode = "<center><table class=\"\"><tr>"
		columns = 0
		filesnames.each do |name|
			htmlcode = htmlcode + "<td align=\"center\"><p>#{name.capitalize}</p><p><img src=\"img/#{name}.jpg\" width=\"100\" height=\"50\" ></p></td>"
			columns += 1
			if columns == 3
				htmlcode = htmlcode + "</tr><tr>"
				columns = 0
			end
		end
		htmlcode = htmlcode + "</tr></table></center>"

		return htmlcode
	end

		private

		def self.generate_files_names
			filenames = Dir.glob("./public/img/*.jpg")
			filenames.each do |name|
				name.slice!("./public/img/")
				name.slice!(".jpg")
			end
		end

		def self.generate_urls_names
			urlsnames = Dir.glob("./public/img/*.jpg")
			urlsnames.each do |urls|
				urls.slice!("./public")
			end
		end
end