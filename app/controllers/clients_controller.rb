class ClientsController < ApplicationController
  def index
  	@clients = Client.order(:name)
  end

  def new
  	@client = Client.new
  end

  def create
  	@client = Client.new(client_params)

  	if @client.save
  		redirect_to clients_path
  	else
  		render :new
  	end
  end

  def edit
  	@client = Client.find(params[:id])
  end

  def update
  	@client = Client.find(params[:id])
  end

  def show
  	@client = Client.find(params[:id])
  end

  private
  	def client_params
  		params.require(:client).permit!
  	end
end
