class PingController < ApplicationController
  def ping
    render json: { message: 'Hi Emma papi Kike finally could set me up' }, status: :ok
  end
end
