class RevenuesController < ApplicationController

  def index
    @revenues = Revenue.order("id").page(params[:page]).per_page(3)
  end

  def show
    @revenue = Revenue.find(params[:id])
  end

  def new
    @revenue = Revenue.new(revenue_params)
  end

  def create
    @revenue = Revenue.new(revenue_params)
    if @revenue.save
      redirect_to @revenue, notice: 'Einnahme wurde gebucht.'
    else
      render :new
    end
  end

  def edit
    load_revenue
  end

  def update
    load_revenue
    if @revenue.update(revenue_params)
      redirect_to @revenue, notice: 'Einnahme wurde aktualisiert'
    else
      render :edit
    end
  end

  def destroy
    load_revenue
    @expense.destroy
    redirect_to revenues_path, notice: 'Einnahme wurde gelöscht'
  end

  private

    def load_revenue
      @revenue = Revenue.find(params[:id])
    end

    def revenue_params
      revenue_params = params[:revenue] || ActionController::Parameters.new
      revenue_params.permit(Revenue.permitted_params)
    end

end