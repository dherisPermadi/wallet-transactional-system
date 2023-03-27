# class of json response
module Response
  def json_response(object, status = :ok)
    render json: object, status: status.to_sym
  end

  def message_response(message, status = :ok)
    render json: { message: }, status:
  end

  def validate_response(message, status = :unprocessable_entity)
    render json: { message: }, status:
  end

  def unauthorized_response
    render json: { message: 'your are not authorized !' }, status: :unauthorized
  end
end
