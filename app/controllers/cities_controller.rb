class CitiesController < ApplicationController

	def index
		@cities = City.all
	end
	def new
		@city = City.new
	end

	def create
			@city = City.create(city_params)
			redirect_to @city
	end

	def show
			@city = City.find_by_id(params[:id])
	end

	def edit
		city_id = params[:id]
		@city = City.find_by_id(city_id)
	end
	def update
		city_id = params[:id]
		city = City.find_by_id(city_id)
		city.update_attributes(city_params)
		if city.save
			redirect_to city_path(city)
		end
	end
	def destroy
		city_id = params[:id]
		city = City.find_by_id(city_id)
		city.destroy
		redirect_to cities_path
	end

	private

	def city_params
		params.require(:city).permit(:name, :image)
	end
end
