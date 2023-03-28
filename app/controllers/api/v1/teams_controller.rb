module Api
  module V1
    class TeamsController < ApplicationController
      before_action :must_be_authorized
      before_action :set_team, only: :show

      def index
        teams = client_type.eql?('user') ? Team.all : Team.where.not(id: current_client)
        teams = teams.order(created_at: :desc)
                     .page(params[:page] || 1)
                     .per(params[:per_page] || 15)
        serializer = generate_collection_serializer(teams, Lists::TeamSerializer)
        json_response_page(serializer, teams)
      end

      def show
        @team ? json_response(TeamSerializer.new(@team)) : validate_response('Data not found!')
      end

      private

      def set_team
        @team = Team.find(params[:id])
      end
    end
  end
end
