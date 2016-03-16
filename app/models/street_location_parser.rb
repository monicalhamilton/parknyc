require 'rgeo/shapefile'

class StreetLocationParser
	include ActiveModel::Model

	attr_accessor :street_location_file_name

	def init(params = {})
		@street_location_file_name = params[:street_location_file_name]
	end

	def parse_file
		RGeo::Shapefile::Reader.open(street_location_file_name) do |file|
			file.each do |record|
				puts "Record number #{record.index}:"
				puts "  Geometry: #{record.geometry.as_text}"
				puts "  Attributes: #{record.attributes.inspect}"
			end
			file.rewind
			record = file.next
		end
	end
end
