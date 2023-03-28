# class of json response
module Response
  def json_response(object, status = :ok)
    render json: { data: object }, status: status.to_sym
  end

  def message_response(message, status = :ok)
    render json: { message: }, status:
  end

  def validate_response(message, status = :unprocessable_entity)
    render json: { message: }, status:
  end

  def json_response_page(object, data, opts = {}, status = :ok)
    pagination = pagination_setup(data)
    response_hash = { data: object }.merge(opts)
                                    .merge(pagination: pagination.to_h)
                                    .merge(status: status.to_sym)
    render json: response_hash
  end

  def unauthorized_response
    render json: { message: 'your are not authorized !' }, status: :unauthorized
  end

  private

  def pagination_setup(data)
    { current_page: data.current_page,
      total_pages: data.total_pages,
      total_count: data.total_count,
      next_page: data.next_page,
      prev_page: data.prev_page,
      first_page: data.first_page?,
      last_page: data.last_page? }
  end
end
