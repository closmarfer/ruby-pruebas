class Carrito
	attr_reader :carrito
	
	def initialize()
		@carrito = []
	end

	def add_cesta(art)
		@carrito << art
	end

end
