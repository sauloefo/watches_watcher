class Watch::BrandsController < ApplicationController
  before_action :set_watch_brand, only: %i[ show edit update destroy ]

  # GET /watch/brands or /watch/brands.json
  def index
    @watch_brands = Watch::Brand.all
  end

  # GET /watch/brands/1 or /watch/brands/1.json
  def show
  end

  # GET /watch/brands/new
  def new
    @watch_brand = Watch::Brand.new
  end

  # GET /watch/brands/1/edit
  def edit
  end

  # POST /watch/brands or /watch/brands.json
  def create
    @watch_brand = Watch::Brand.new(watch_brand_params)

    respond_to do |format|
      if @watch_brand.save
        format.html { redirect_to @watch_brand, notice: "Brand was successfully created." }
        format.json { render :show, status: :created, location: @watch_brand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @watch_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /watch/brands/1 or /watch/brands/1.json
  def update
    respond_to do |format|
      if @watch_brand.update(watch_brand_params)
        format.html { redirect_to @watch_brand, notice: "Brand was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @watch_brand }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @watch_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watch/brands/1 or /watch/brands/1.json
  def destroy
    @watch_brand.destroy!

    respond_to do |format|
      format.html { redirect_to watch_brands_path, notice: "Brand was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watch_brand
      @watch_brand = Watch::Brand.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def watch_brand_params
      params.expect(watch_brand: [ :name ])
    end
end
