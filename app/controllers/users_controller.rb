class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_token, except:[:login, :create, :update, :destroy]
  before_action :authorize_user, except:[:login, :create, :index, :update, :destroy]

  def login
    puts "Login"
    user = User.find_by(username: params[:user][:username])

# Testing.. to reset password
    # userid = user.id
    # puts userid
    # if userid == 1
    #   puts "userid is 1"
    #   resetpassword(userid)
    # end

    if user && user.authenticate(params[:user][:password])
      token = create_token(user.id, user.username)

      friends = Friend.where(user_id: user.id)
      render json: {status: 200, user: user, token: token, friends: friends}
    else
      render json: {status: 401, message: "Unauthorized"}
    end
  end

  def create_token(id, username)
    JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
  end

  def payload(id, username)
    {
      exp: (Time.now + 30.minutes).to_i,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username
      }
    }
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    # render json: get_current_user
    render json: @user
  end


    # POST /users
  def create

    #  puts params
    #  @user = User.new(user_params)
    #  @user.name = params[:name]
    #        @user.username = params[:username]
    #          @user.password_digest = params[:password]
    #       #  @user.password = hashed_password
     #
          #  render json: @user, status: :created, location: @user


    tempUser = User.find_by_username(params[:username])


    if tempUser
      puts "Username is already taken."
      puts "++++++++++++++++++++++++++++++++"
      render json: {error: "The username is already taken."}
    else

          hashed_password = BCrypt::Password.create(params[:password])
          @user = User.new(user_params)
          @user.name = params[:name]
          @user.username = params[:username]
          # @user.password = params[:password]
          @user.password_digest = hashed_password
          @user.email = params[:email]

          if @user.save
            render json: @user, status: :created, location: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
      end

  end

  # PATCH/PUT /users/1
  def update
    puts "Updating user information...."
    userId = params[:id]
    user = params[:user]
    @user = User.find(params[:id])
    if user[:password] != nil
      hashed_password = BCrypt::Password.create(params[:password])
      @user.password_digest = hashed_password
    end
    if user[:name] != nil
      @user.name = user[:name]
    end
    if user[:email] != nil
      @user.email = user[:email]
    end

    @user.save
    render json: {status: 200, user: @user}

  end

  # DELETE /users/1
  def destroy
    userId = params[:id]
    puts userId
    # Friend.where(user_id: userId).destroy
    User.find(params[:id]).destroy
    render json: {message: "Deleted User Successful"}
  end

  def resetpassword(id)
    # puts "resetpassword", id
    # @user = User.find(id)
    #  hashed_password = BCrypt::Password.create('test')
    #  puts hashed_password
    # @user.password_digest = hashed_password
    # @user.save
    #
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :name, :password_digest, :email)
    end
end
