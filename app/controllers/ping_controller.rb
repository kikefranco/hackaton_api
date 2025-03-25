class PingController < ApplicationController
  def ping
    render json: { message: 'hi wizeliner, good luck in the hackathon' }, status: :ok
  end
end
