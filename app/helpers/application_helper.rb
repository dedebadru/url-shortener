module ApplicationHelper
	def link_destination(data)
		link_to data.destination_url.gsub(/\Ahttp:\/\/|\Ahttps:\/\//, ""), data.destination_url, target: "_blank"
	end

	def link_short(data)
		link_to "#{request.host_with_port}/#{data.short_url}", short_path(data.short_url), target: "_blank"
	end
end
