class Email < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.recepcion.subject
  #
  def recepcion
    @greeting = "Hola, soy Rails"

    mail to: "cjmartinfernandez@gmail.com", :subject => "Nuestro primer correo pa gmail"
  end

  def enviar_cliente(params)
    @nombre = params[:nombre]
    @email = params[:email]
    @asunto = params[:asunto]
    @comentarios = params[:comentarios]

    mail to: params[:email], :subject => "Gracias por contactar con Coviran"
  end

  def enviar_administrador(params)
    @nombre = params[:nombre]
    @email = params[:email]
    @asunto = params[:asunto]
    @comentarios = params[:comentarios]

    mail to: "cjmartinfernandez@gmail.com", :subject => "Mensaje con asunto: " + params[:asunto]
  end
end
