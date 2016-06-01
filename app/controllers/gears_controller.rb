class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update]
  before_action :authenticate_user!, except:[:show]
  
  def index
    @gears= current_user.gears
  end

  def show
    
  end

  def new
    @gear = current_user.gears.build
  end

  def create
     @gear = current_user.gears.build(gear_params)
     if @gear.save
      redirect_to @gear, notice: "Saved..."
    else
      render :new
    end

  end

  def edit
    
  end

  def update
    if @gear.update(gear_params)
      redirect_to @gear, notice: "Updated.."
    else
      render :edit
    end

  end

  private
  def set_gear
      @gear = Gear.find(params[:id])
  end

  def gear_params
      params.require(:gear).permit(:gear_type, :price, :availability, :location, :description, :is_insurance, :active)
  end

end
