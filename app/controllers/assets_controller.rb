class AssetsController < ApplicationController

  def index
    @assets = Asset.all
  end

  def show
    @asset = load_asset
  end

  def new
    @asset = Asset.new(asset_params)
  end

  def create
    @asset = Asset.new(asset_params)
    if @asset.save
      redirect_to @asset, notice: 'Sachanlage wurde gebucht.'
    else
      render :new
    end
  end

  def edit
    load_asset
  end

  def update
    load_asset
    if @asset.update(asset_params)
      redirect_to @asset, notice: 'Sachanlage wurde aktualisiert.'
    else
      render :edit, notice: 'Sachanlage konnte nicht aktualisiert werden.'
    end
  end

  def destroy
    load_asset
    @asset.destroy
    redirect_to assets_path, notice: 'Sachanlage wurde gelöscht'
  end

  private

    def load_asset
      @asset = Asset.find(params[:id])
    end

    def asset_params
      asset_params = params[:asset] || ActionController::Parameters.new
      asset_params.permit(Asset.permitted_params)
    end
end