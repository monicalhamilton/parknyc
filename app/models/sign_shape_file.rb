require 'rgeo/shapefile'

class SignShapeFile
	include ActiveModel::Model

	attr_accessor :sign_shape_file

	def init(params = {})
		@sign_shape_file = params[:sign_shape_file]
	end

	def parse_file
		RGeo::Shapefile::Reader.open(sign_shape_file) do |file|
			file.each do |record|
				x_coordinate = record.geometry.x
				y_coordinate = record.geometry.y
				order_number = record.attributes['SG_ORDER_N']
				street_location = StreeLocation.find_by(order_number: order_number)
				object_id = record.attributes['OBJECTID']
				sequence_number = record.attributes['SG_SEQNO_N']
				sign_code = record.attributes['SG_MUTCD_C']
				curb_distance_feet = record.attributes['SR_DIST']
				sign_faces = record.attributes['SG_SIGN_FC']
				sign_arrows = record.attributes['SG_ARROW_D']
				sign_description = record.attributes['SIGNDESC1']


				sign = Sign.create(
					x_coordinate: x_coordinate,
					y_coordinate: y_coordinate,
					street_location: street_location,
					object_id: object_id,
					sequence_number: sequence_number,
					sign_code: sign_code
					curb_distance_feet: curb_distance_feet,
					sign_faces: sign_faces,
					sign_arrows: sign_arrows,
					sign_description: sign_description
					)
			end
		end
	end
end
