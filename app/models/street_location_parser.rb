require 'rgeo/shapefile'

class StreetLocationParser < ActiveRecord::Base
  belongs_to :street_location
end
