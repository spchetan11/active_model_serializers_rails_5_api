class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :orders_attributes => [:user_id, :order_number, :quantity, :id, :_destroy])
    end
end


#add to User model ->  accepts_nested_attributes_for :orders, :allow_destroy => true

#nested association order becomes orders_attributes in controller parameters and in json request.

#id for orders_attributes should be present other wise it will create a new record.

#pass this json for patch request in postman

# {
#     "user": {
#         "name": "chetan.s.p",
#         "email": "s.p.chetan11@gmail.com",
#         "orders_attributes": [
#             {
#                 "id": 1,
#                 "order_number": 999,
#                 "quantity": 99
#             }
         
#         ]
#     }
# }