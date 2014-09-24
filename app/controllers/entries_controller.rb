class EntriesController < ApplicationController

  def index
    @entries = Entry.order(:id)
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new(entry_params)
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to @entry, notice: 'Ausgabe wurde gebucht.'
    else
      render :new
    end
  end

  def edit
    load_entry
  end

  def update
    load_expense
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Ausgabe wurde aktualisiert'
    else
      render :edit
    end
  end

  def destroy
    load_entry
    @entry.destroy
    redirect_to entries_path, notice: 'Ausgabe wurde gelöscht'
  end

  private

    def load_expense
      @entry = Entry.find(params[:id])
    end

    def entry_params
      entry_params = params[:entry] || ActionController::Parameters.new
      entry_params.permit(Entry.permitted_params)
    end

end