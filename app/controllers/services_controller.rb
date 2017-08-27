class ServicesController < ApplicationController
  def index
  	@services  = Service.all.group_by { |service| service.name }
  end
end
