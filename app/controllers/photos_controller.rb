class PhotosController < ApplicationController
	def 
	@photo = Photo.find(params[:id])
	gear = @photo.gear	
	
	@photo.destroy
	@photos= Photo.where(gear_id: gear.id)

	respond_to :js
	end

end
