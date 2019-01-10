module Beehive
  module Admin
    module Settings
      class TaxonsController < BaseController
        include Pagy::Backend

        before_action :set_taxonomy

        breadcrumb 'Settings', :admin_settings_path
        breadcrumb 'Taxonomies', :admin_settings_taxonomies_path
        breadcrumb -> { @taxonomy.decorate.to_s }, -> { admin_settings_taxonomy_taxons_path(@taxonomy) }

        def index
          authorize Taxon
          breadcrumb 'Taxons', admin_settings_taxonomy_taxons_path(@taxonomy)

          @q = @taxonomy.taxons.ransack(params[:q])
          results = @q.result(distinct: true)
          @pagy, @taxons = pagy(results)
        end

        def show
          @taxon = find_taxon
          redirect_to edit_admin_settings_taxon_path(@taxon)
        end

        def edit
          @taxon = find_taxon
          authorize @taxon

          breadcrumb 'Taxons', admin_settings_taxonomy_taxons_path(@taxonomy)
          breadcrumb @taxon.decorate.to_s, edit_admin_settings_taxonomy_taxon_path(@taxon.id)
        end

        def new
          authorize Taxon
          @taxon = Taxonomy.new
        end

        def update
          @taxon = find_taxon
          authorize @taxon
          breadcrumb @taxon.to_s, admin_settings_taxonomies_path(@taxon)

          if @taxon.update_attributes(taxon_params)
            redirect_to edit_admin_settings_taxonomy_taxon_path(@taxon)
          else
            render :edit
          end
        end

        def create
          authorize Taxon
          @taxon = Taxon.new(taxon_params)
          @taxon.taxonomy_id = @taxonomy.id

          if @taxon.save!
            redirect_to admin_settings_taxonomy_taxons_path
          else
            render :new
          end
        end

        def destroy
          @taxon = find_taxon
          authorize @taxon

          @taxon.destroy
          redirect_to admin_settings_taxonomies_path
        end

        private

        def find_taxon
          Taxon.find(params[:id])
        end

        def set_taxonomy
          @taxonomy = Taxonomy.find(params[:taxonomy_id])
        end

        def taxon_params
          params.require(:taxon).permit(:name, :description)
        end
      end
    end
  end
end
