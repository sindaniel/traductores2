class CodesController < ApplicationController
   before_action :authenticate_user!, :except => [:consulta,:adduse]
  def index

    if !params[:codigo].nil?
      if params[:codigo] != ''
        @codes = Code.all.where('code'=>params[:codigo])

      else
        @codes = Code.all.page
      end

    else
      @codes = Code.all.page
    end

  end



  def consulta
    @code = Code.find_by_code(params[:code]);

    if @code.blank?

      data = [
          'blank'=> '-1'
      ]

    else



      @minutes = 0
      @code.registers.each do |register|
        @minutes = @minutes + register.time
      end

      disponible = @code.minutes - @minutes
      data = [
          'usado' => @minutes,
          'total'=> @code.minutes,
          'disponible' => disponible,
          'blank'=> '1'
      ]



    end


    render json: data


  end

  def generate

    if request.post?


      loops(params[:cantidad], params[:minutos])
      redirect_to codes_path

    end

  end


  def loops veces, minutos

errores = 0
veces = veces.to_i
  veces.times.map{



      numero = Random.rand(999999999999).to_s

      digitos =  numero.length

      if(digitos < 12)
        cantidadReponer = 12 - digitos

        for i in 1..cantidadReponer
          numero = '0'+numero
        end


      end

      puts numero


      code = Code.new()

      code.code = numero
      code.minutes = minutos


      if code.save
        flash[:notice] = 'Información creada correctamente'

      else
        errores = errores + 1
      end


      if(errores > 0)
        loops(errores, minutos)
      else

      end







    }



  end

  def adduse

    @id = Code.find_by_code(params[:code])



    time = params[:time]
    idioma = params[:idioma]
    code = Register.new()

    code.code_id = @id.id
    code.time = time
    code.idioma = idioma



    if time.to_i > 1

      if code.save
        flash[:notice] = 'Información creada correctamente'
      else
        errores = errores + 1
      end

    end


  end






end
