module Beehive
  module Admin
    module Settings
      class TaxonomiesController < BaseController
        include Pagy::Backend

        breadcrumb 'Settings', :admin_settings_path
        breadcrumb 'Taxonomies', :admin_settings_taxonomies_path

        def index
          authorize Taxonomy

          @q = Taxonomy.ransack(params[:q])
          results = @q.result(distinct: true)
          @pagy, @taxonomies = pagy(results)
        end

        def show
          @taxonomy = find_taxonomy
          redirect_to admin_settings_taxonomy_taxons_path(@taxonomy)
        end

        def edit
          @taxonomy = find_taxonomy
          authorize @taxonomy
          breadcrumb @taxonomy.decorate.to_s, admin_settings_taxonomy_path(@taxonomy.id)
        end

        def new
          authorize Taxonomy
          @taxonomy = Taxonomy.new
        end

        def update
          @taxonomy = find_taxonomy
          authorize @taxonomy
          breadcrumb @taxonomy.to_s, admin_settings_taxonomies_path(@taxonomy)

          if @taxonomy.update_attributes(taxonomy_params)
            redirect_to admin_settings_taxonomies_path
          else
            render :edit
          end
        end

        def create
          authorize Taxonomy
          @taxonomy = Taxonomy.new(taxonomy_params)

          if @taxonomy.save
            redirect_to admin_settings_taxonomies_path
          else
            render :new
          end
        end

        def destroy
          @taxonomy = find_taxonomy
          authorize @taxonomy

          @taxonomy.destroy
          redirect_to admin_settings_taxonomies_path
        end

        private

        def find_taxonomy
          Taxonomy.find(params[:id])
        end

        def taxonomy_params
          params.require(:taxonomy).permit(:name, :description)
        end
      end
    end
  end
end
