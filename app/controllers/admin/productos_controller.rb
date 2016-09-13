class Admin::ProductosController < ApplicationController
  layout "admin"
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to admin_productos_url, notice: 'El producto ha sido creado bien.' }
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
        format.html { redirect_to admin_productos_url, notice: 'El producto ha sido creado bien.' }
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
      format.html { redirect_to admin_productos_url, notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def quienes_somos

    @titulo_general = @titulo = "Quiénes somos"
    @contenido = "<p>Somos la caña de Graná</p>"
  end

  def contacto

    @titulo_general = @titulo = "Contacta con nosotros"
    @contenido = "<p>Llama al 958 548721 o escribe al hola@coviran.es</p>"
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
end
