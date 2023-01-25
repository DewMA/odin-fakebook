class SearchController < ApplicationController

    def search
        @results = User.all.where("email ~* ?", params[:search])
    end

end