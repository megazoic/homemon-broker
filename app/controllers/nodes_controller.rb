class NodesController < ApplicationController
  def create
    @node = Node.new(node_params)
    nodeNames = ["GreatRoom", "Garage"]
    @node.name = nodeNames[params[:node][:name].to_i]
    if @node.save
      render text: "|NodeSaved=1|"
    else
      render text: "|NodeSaved=0|"
    end
  end
  private
    def node_params
      params.require(:node).permit(:name, :ack)
    end
end
