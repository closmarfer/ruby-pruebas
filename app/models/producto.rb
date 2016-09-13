class Producto < ActiveRecord::Base

	mount_uploader :imagen, ImageUploader

end
