class EntrypointsController < ApplicationController
  skip_before_action :authenticate, only: [:index]
  def index
    @entrypoints = Entrypoint.all.order(:created_at)
    @nodes = Node.all.order(:created_at)
  end
  def create
    @entrypoint = Entrypoint.new(entrypoint_params)
    if @entrypoint.save
      render text: "|EntrypointSaved=1|"
    else
      render text: "|EntrypointSaved=0|"
    end
  end
  private
    def entrypoint_params
      params.require(:entrypoint).permit(:location, :status, :error_state)
    end
end
