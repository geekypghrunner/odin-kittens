class KittensController < ApplicationController

    def new
        @kitten=Kitten.new
    end
    
    def create
        @kitten = Kitten.create(:name => params[:kitten][:name], :age => params[:kitten][:age], :cuteness => params[:kitten][:cuteness], :softness => params[:kitten][:softness])
        redirect_to root_path
    end
    
    def index
        @kittens = Kitten.all
        respond_to :html, :json
    end
    
    def show
        @kitten = Kitten.find(params[:id])
    end
    
    def edit
        @kitten = Kitten.find(params[:id])
    end
    
    def update
        @kitten = Kitten.find(params[:id])
        @kitten.update_attributes(:name => params[:kitten][:name], :age => params[:kitten][:age], :cuteness => params[:kitten][:cuteness], :softness => params[:kitten][:softness])
        redirect_to kitten_path(@kitten)
    end
    
    def destroy
        Kitten.find(params[:id]).destroy
        redirect_to kittens_path
    end


end
