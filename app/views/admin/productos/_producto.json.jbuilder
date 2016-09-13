json.extract! producto, :id, :nombre, :descripcion, :precio, :imagen, :created_at, :updated_at
json.url producto_url(producto, format: :json)