class UploadController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def create
    file = params[:file]
    filename = SecureRandom.hex(5) + Rack::Mime::MIME_TYPES.invert[file.content_type]
    path = File.join('public', 'uploads', filename)
    File.open(path, 'wb') {|f| f.write(file.read)}

    render json: {status: 'success', src: URI.join(request.base_url, '/uploads/', filename)}.to_json
  end
end
