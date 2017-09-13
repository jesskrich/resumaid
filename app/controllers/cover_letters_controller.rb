class CoverLettersController < ApplicationController
    def index
        @cover_letters = CoverLetter.all.order('created_at DESC')
    end
    def new
        @cover_letter = CoverLetter.new
    end
    def create
        @cover_letter = CoverLetter.new(cover_letter_params)

        if @cover_letter.save
            redirect_to @cover_letter
        else
            render 'new'
        end
    end

    def show
        @cover_letter = CoverLetter.find(params[:id])
    end

    def edit
        @cover_letter = CoverLetter.find(params[:id])
    end

    def update
        @cover_letter = CoverLetter.find(params[:id])

        if @cover_letter.update(params[:cover_letter].permit(:name, :body))
            redirect_to @cover_letter
        else
            render 'edit'
        end
    end

    def destroy
        @cover_letter = CoverLetter.find(params[:id])
        @cover_letter.destroy

        redirect_to @cover_letter
    end

    private
        def cover_letter_params
            params.require(:cover_letter).permit(:name, :body)
        end
end
