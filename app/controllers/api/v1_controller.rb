class Api::V1Controller < ApplicationController
  before_action :set_cors_headers

  rescue_from Exception, with: :respond_with_exception

  def show
    render_json success: true, message: "API ready", version: 1
  end

  private

    def render_json object
      render json: JSON.pretty_generate(object.as_json)
    end

    def set_cors_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

    def respond_with_exception(exc)
      render_unknown_format and return if ActionController::UnknownFormat === exc
      backtrace = exc.backtrace.map { |line|
        if line =~ /^#{Rails.root}/
          line.sub /^#{Rails.root}/, ''
        end
      }.compact.slice(0, 5)
      render json: JSON.pretty_generate(success: false, code: :internal_server_error, exception: exc.class, message: exc.message, backtrace: backtrace) + "\n", status: :internal_server_error
    end

    def render_unknown_format
      render json: JSON.pretty_generate(
        success: false,
        code: :unknown_format,
        message: params[:format].present? ? "Cannot serve #{params[:format]} here" : "You need to define a format",
        path: "#{request.method} #{request.path}")
    end
end
