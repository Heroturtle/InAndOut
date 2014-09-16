class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		load_category
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to @category, notice: 'Kategorie wurde erstellt.'
    else
      render :edit, alert: "Etwas ging falsch, genau spezifieren was"
		end
	end

	def edit
		load_category
	end

	def update
		load_category
    if @category.update(category_params)
      redirect_to @category, notice: 'Kategorie wurde aktualisiert'
    else
      render :edit, alert: "Etwas ging falsch, genau spezifieren was"
    end
  end

	def destroy
		load_category
		@category.destroy
		redirect_to categories_path, notice: 'Kategorie wurde geloescht.'
	# rescue ActiveRecord::DeleteRestrictionError
	# 	redirect_to @category, alert: "Mit dieser Kategorie sind Ausgaben verbunden. Sie kann daher nicht gelöscht werden."
	end

		# if Expense.exists?(category: @category)
		# 	flash[:alert] = "Mit dieser Kategorie sind Ausgaben verbunden. Sie kann daher nicht gelöscht werden."
		# 	redirect_to category_path(@category)
		# else
		# 	@category.destroy
		# 	flash[:notice] = "Kategorie wurde gelöscht."
		# 	redirect_to categories_path
		# end

	private

		def load_category
      @category = Category.find(params[:id])
    end

		def category_params
			params.require(:category).permit(:name, :description)
		end

end