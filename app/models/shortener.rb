class Shortener < ActiveRecord::Base
	before_validation :set_value
  validates :short_url, :destination_url, :own_ip, presence: true
	scope :list, lambda { where(own_ip: self.ip) }

	def self.ip
	  orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
	  UDPSocket.open do |s|
	    s.connect '64.233.187.99', 1
	    s.addr.last
	  end
		ensure
	  Socket.do_not_reverse_lookup = orig
	end

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

	protected
		def set_value
			self.own_ip = self.class.ip
		  unless self.destination_url[/\Ahttp:\/\//] || self.destination_url[/\Ahttps:\/\//]
		    self.destination_url = "http://#{self.destination_url}"
		  end
		end
end
