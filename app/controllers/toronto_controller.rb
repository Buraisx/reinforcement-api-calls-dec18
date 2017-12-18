class TorontoController < ApplicationController
	def exercise1
		@names = []
		toronto_wards_response = HTTParty.get('https://represent.opennorth.ca/boundaries/toronto-wards/')
		toronto_wards_json = JSON.parse(toronto_wards_response.body)
		toronto_wards_json["objects"].each do |ward|
			@names << ward["name"]
		end
	end

	def exercise2
		@person = {}
		representatives_response = HTTParty.get('https://represent.opennorth.ca/representatives/')
		representatives_body = JSON.parse(representatives_response.body)
		representatives_body['objects'].each do |representative|
			@person[representative["name"]] = representative["party_name"]
		end
	end
end
