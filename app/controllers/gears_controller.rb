class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @gears= current_user.gears
  end

  def show
    @photos = @gear.photos
  end

  def new
    @gear = current_user.gears.build
  end

  def create
     @gear = current_user.gears.build(gear_params)

     if @gear.save
      
      if params[:images]
        params[:images].each do |image|
          @gear.photos.create(image: image)
        end
      end
      @photos = @gear.photos
      redirect_to edit_gear_path(@gear), notice: "Saved..."
    else
      render :new
    end
  end

  def edit
    if current_user.id == @gear.user.id
    @photos = @gear.photos
  else
    redirect_to root_path, notice: "You don't have permission."
  end
 end

  def update
    if @gear.update(gear_params)

      if params[:images]
        params[:images].each do |image|
          @gear.photos.create(image: image)
        end
      end
    
      redirect_to edit_gear_path(@gear), notice: "Updated..."
      
    else
      render :edit
    end

  end

  private
  def set_gear
      @gear = Gear.find(params[:id])
  end

  def gear_params
      params.require(:gear).permit(:gear_type, :price, :listing_name, :location, :description, :is_insurance, :active)
  end

end
