

class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]


  # GET /friends
  def index
    userId = params[:user_id]
    @friends = Friend.where(user_id: userId)
    render json: @friends
  end

  # GET /friends/1
  def show
    render json: @friend
  end

  # POST /friends
  def create
    @friend = Friend.new(friend_params)
    address = " "
    city = ""
    state = ""
    zip = " "
    phone = ""
    userid = 0
    userid = params[:user_id]

    @friend.user_id = userid
    address = @friend.address
    cite = @friend.city
    state = @friend.state
    zip = @friend.zip_code
    phone  = @friend.phone

    # will check geo .. get lat/longtitude
    @friend.fulladdress = address + ", " + city + " " + state + " " + zip

    if @friend.save
      # render json: @friend, status: :created, location: @friend
      # @friends = Friend.all
      @friends = Friend.where(user_id: userid)

      render json: @friends , status: :created
    else
      render json: @friend.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /friends/1
  def update

    friend = params[:friend]

    @friend = Friend.find(friend[:id])

    address = ""
    city = ""
    state = ""
    zip = " "
    phone = ""
    uuserid = 0

    address = friend[:address]
    city = friend[:city]
    state = friend[:state]
    zip = friend[:zip_code]
    phone  =friend[:phone]
    userid = params[:userId]



    # @friend = friend
    @friend[:id] = friend[:id]
    @friend[:user_id] = friend[:user_id]
    @friend[:address] = friend[:address]
    @friend[:city] = friend[:city]
    @friend[:state] = friend[:state]
    @friend[:zip_code] = friend[:zip_code]
    @friend[:name] = friend[:name]
    @friend[:phone] = friend[:phone]
    @friend[:email] = friend[:email]
    @friend[:fulladdress] = address + ", " + city + " " + state + " " + zip

    if @friend.update(friend_params)
      @friends = Friend.where(user_id: userid)
      render json: @friends
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friend_params
      params.require(:friend).permit(:name, :address, :city, :state, :zip_code, :latitude, :longitude, :phone, :phone_company, :image, :email)
    end
    # def friend_params
    #   params.require(:friend).permit(:name)
    # end
end
