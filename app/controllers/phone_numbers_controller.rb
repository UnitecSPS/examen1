class PhoneNumbersController < ApplicationController
  def new
 		@client = Client.find(params[:client_id])
 		@phone_number = PhoneNumber.new(primary: @client.phone_numbers.count == 0)
  end

  def create
  	@client = Client.find(params[:client_id])
  	@phone_number = @client.phone_numbers.build(phone_number_params)

  	if @phone_number.save
  		redirect_to @client
  	else
  		render :new
  	end
  end

  def edit
  end

  private

  	def phone_number_params
  		params.require(:phone_number).permit!
  	end
end
