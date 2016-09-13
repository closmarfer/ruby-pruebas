class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  before_filter :autorizar



  # GET /productos
  # GET /productos.json
  def index
    @titulo_general = @titulo = "Todos los productos Covirán"
    @productos = Producto.all
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    @titulo_general = @titulo = "Mostrando el producto"
  end

  # GET /productos/new
  def new
    @titulo_general = @titulo = "Nuevo producto"
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
    @titulo_general = @titulo = "Editar producto"
  end

  # POST /productos
  # POST /productos.json
  def create
    @titulo_general = @titulo = "Crear producto"
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto was successfully created.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    @titulo_general = @titulo = "Actualizar producto"
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @titulo_general = @titulo = "Eliminar producto"
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def quienes_somos

    @titulo_general = @titulo = "Quiénes somos"
    @contenido = "<p>Somos la caña de Graná</p>"
  end

  def contacto
    if request.post?
      flash[:notice] = "has pasado estos parámetros: " + params.to_s
    end

    @titulo_general = @titulo = "Contacta con nosotros"
    @contenido = "<p>Llama al 958 548721 o escribe al hola@coviran.es</p>"

    # Pruebas para apuntes (ver controller avanzado)
    @accion = action_name
    @controlador = controller_name
    @metodo = request.request_method

    #Envío de un email simplemente con entrar en "contacto"
    if request.post?
      #Enviamos el correo
      begin #params son los parámetros que nos llegan por post
        if Email.enviar_administrador(params).deliver_now and Email.enviar_cliente(params).deliver_now
          flash.now[:notice] = "Se ha enviado el email"
        end
      rescue
        flash.now[:notice] = "Se ha enviado el email" + Email.errors

      end
      
    end
    

  end

  def anadir_carrito
    @producto = Producto.find(params[:id])
    # Generamos la variable de sesion o si ya existe no hacemos nada
    sesion_carrito
    # Agregamos el producto al carrito
    session[:carrito] << @producto

    # @carrito.add_cesta(@producto)

    respond_to do |format|
      texto = "Ver carrito"
      format.html { redirect_to productos_url, notice: "Producto añadido al carrito. " + ActionController::Base.helpers.link_to(texto, carro_url)}
      format.json { head :no_content }
    end
  end

  def ver_carrito
    @titulo_general = @titulo = "Tu cesta de la compra"
    @carrito = session[:carrito]
  end

  def vaciar_carrito
    session[:carrito] = nil
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'Carrito vacío correctamente.'}
      format.json { head :no_content }
    end
  end

  def method_missing(method, *args)
    render :text => "Error al llamar a #{method}"

  end



  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:nombre, :descripcion, :precio, :imagen)
    end

    # No debería llamarse desde fuera
    def sesion_carrito
      if !session[:carrito]
        session[:carrito] = []
      end

      # return session[:carrito]
      # session[:carrito] ||= Carrito.new #Esta sintaxis significa que si no existe lo crea
    end

    def autorizar
        logger.info("Se ha ejecutado el controller productos y esto se hace antes de ejecutar el controlador")
     end
end
