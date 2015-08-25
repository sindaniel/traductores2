class PhonesController < ApplicationController
  def index

    @phones = Phone.where(:language_id=>params[:language_id]).all
    @language = Language.find_by_id(params[:language_id])


    respond_to do |format|
      format.html
      format.json { render :json => @phones }
    end

    
  end

  def new


    @language = Language.find_by_id(params[:language_id])
    @phone = Phone.new(:language_id => @language)

  end

  def create


    @phone = Phone.new(allowed_params)
    @phone.language_id = params[:language_id]
    if @phone.save
      flash[:notice] = 'Información agregada correctamente'
      redirect_to language_phones_path
    else
      render 'new'
    end


  end

  def edit

    @phone = Phone.find(params[:id])


    @language = Language.find_by_id(params[:language_id])


  end

  def update


    @phone = Phone.find(params[:id])
    if @phone.update_attributes(allowed_params)
      flash[:notice] = 'Información actualizada correctamente'
      redirect_to language_phones_path
    else
      render 'new'
    end



  end

  def destroy

    @phone = Phone.find(params[:id])
    if @phone.destroy
      flash[:notice] = 'Información eliminada correctamente'
      redirect_to language_phones_path
    else
      render 'new'
    end



  end




  private
  def allowed_params
    params.require(:phone).permit(:name,:phone,:language_id)
  end
end
