class BatchesController < ApplicationController
  before_action :set_batch, only: %i[ show edit update destroy ]

  # GET /batches or /batches.json
  def index
    @batches = Batch.order(batch_date: :desc)
  end

  # GET /batches/1 or /batches/1.json
  def show
    
  end

  # GET /batches/new
  def new
    @batch = Batch.new
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches or /batches.json
  def create
    @batch = Batch.new(batch_params)

    set_best_by_date()
    set_batch_number()

    respond_to do |format|
      if @batch.save
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully created." }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1 or /batches/1.json
  def update

    set_best_by_date()

    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully updated." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1 or /batches/1.json
  def destroy
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url, notice: "Batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_params
      params.require(:batch).permit(:batch_number, :batch_date, :best_by_date, :quanity, :product_id)
    end

    def set_best_by_date
      if @batch.batch_date != nil then
        @batch.best_by_date = @batch.batch_date + @batch.product.shelf_life
      end
    end

    def set_batch_number
      if @batch.batch_date != nil then

        month_year = @batch.batch_date.to_fs(:number)[2,4]

        # Get the start and end dates of the month
        start_date = @batch.batch_date.at_beginning_of_month().to_fs(:db)
        end_date = @batch.batch_date.at_end_of_month().to_fs(:db)
        batch_count = Batch.where("batch_date >= :start_date AND batch_date <= :end_date",
          { start_date: start_date, end_date: end_date }).size()
        @batch.batch_number = batch_number = month_year + "-" + batch_count.to_s
        puts "Batch Number set to: " + @batch.batch_number
      end

    end
end
