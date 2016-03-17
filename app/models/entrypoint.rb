class Entrypoint < ActiveRecord::Base
  validates :location, :status, :error_state, presence: true
  validates :location, :status, :error_state, numericality: {only_integer: true}
end
