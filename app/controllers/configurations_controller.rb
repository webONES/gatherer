class ConfigurationsController < ApplicationController
  before_action :set_configuration, only: [:show, :edit, :update, :destroy]

  def index
    @configurations = Configuration.all
    respond_with(@configurations)
  end

  def show
    respond_with(@configuration)
  end

  def new
    @configuration = Configuration.new
    respond_with(@configuration)
  end

  def edit
  end

  def create
    @configuration = Configuration.new(configuration_params)
    @configuration.save
    respond_with(@configuration)
  end

  def update
    @configuration.update(configuration_params)
    respond_with(@configuration)
  end

  def destroy
    @configuration.destroy
    respond_with(@configuration)
  end

  private
    def set_configuration
      @configuration = Configuration.find(params[:id])
    end

    def configuration_params
      params.require(:configuration).permit(:name, :key, :value)
    end
end
