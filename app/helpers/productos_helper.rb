module ProductosHelper
	def enlace(nombre, accion)
		link_to nombre, :action => accion
	end

	def menu_navegacion(opciones)
		html = "<ul>"

		opciones.each do |nombre, accion|
			html += "<li>"
			html += enlace nombre, accion
			html += "</li>"
		end

		html += "</ul>"

		return html.html_safe
	end
end
