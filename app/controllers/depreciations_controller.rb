class DepreciationsController < ApplicationController

  def new
    @depreciation = @asset.depreciation.new
  end

  def create
    @depreciation = @asset.depreciation.new(depreciation_params)
    if @deprecaiton.save
      flash[:notice] = "Abschreibung wurde gebucht."
      redirect_to [@asset, @depreciation]
    else
      flash[:alert] = "Abschreibung konnte nicht verbucht werden."
      render 'new'
    end
  end


  private
  
    def load_asset
      @asset = Asset.find(params[:asset_id])
    end

    def load_depreciation
      @depreciation = @asset.depreciation.find(params[:id])
    end

    def depreciation_params
      params.require(:depreciation).permit(:start_date, :end_date, :amount, :category_id)

end