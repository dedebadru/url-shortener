class ShortenerDetail < ActiveRecord::Base
	belongs_to :shortener

	def self.recording(shortener, request)
		useragent = UserAgent.parse(request.env['HTTP_USER_AGENT'])
		self.create({
			shortener_id: shortener.id,
			ip: Shortener.ip,
			os: os(request.env['HTTP_USER_AGENT']),
			browser: "#{useragent.browser} #{useragent.version} "
		})
	end

	protected
		def self.os(request)
			case request.downcase
				when /mac/i
			    "Mac"
			  when /windows/i
			    "Windows"
			  when /linux/i
			    "Linux"
			  when /unix/i
			    "Unix"
			  else
			    "Unknown"
			end
		end
end
