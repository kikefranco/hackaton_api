class AssetsController < ApplicationController
  def show
    if params[:logo_type] == 'dark' || params[:logo_type] == 'light'
      @logo_type = params[:logo_type]
    else
      render json: { error: 'Type of logo not supported' }, status: :unprocessable_entity and return
    end

    image = Rails.root.join('public', 'light.png')
    image = Rails.root.join('public', 'dark.png') if @logo_type == 'dark'
    image_blob = File.binread(image)

    unless File.exist?(image)
      render json: { error: "I can not find #{@logo_type} image" },
             status: :not_found and return
    end

    text_file = Rails.root.join('public', 'phrases.txt')

    unless File.exist?(text_file)
      render json: { error: 'I can not find a file with prhases' },
             status: :not_found and return
    end

    sentences = File.readlines(text_file).map(&:strip).reject(&:empty?)

    # Pick a random sentence
    random_sentence = sentences.sample

    render json: {
      image: Base64.encode64(image_blob),
      random_sentence:
    }
  end
end
