class EntrypointsController < ApplicationController
  skip_before_action :authenticate, only: [:index]
  def index
    @entrypoints = Entrypoint.all
  end
  def create
    @entrypoint = Entrypoint.new(entrypoint_params)
    if @entrypoint.save
      render text: "Saved"
    else
      render text: "FAILED"
    end
  end
  private
    def entrypoint_params
      params.require(:entrypoint).permit(:location, :status)
    end
end
