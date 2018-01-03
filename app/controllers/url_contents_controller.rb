class UrlContentsController < ApplicationController

    layout false
    skip_before_action :verify_authenticity_token  

    def create
        scrapedContent = UrlContent.parser(url_params)
        if scrapedContent == 403
            render json: { messsage: "Invalid URL" }, status: 412
        else
            newContent = UrlContent.new
            newContent.content = scrapedContent.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
            if newContent.save 
                render json: {message: "Successfully added the url content"}, status: 201
            else 
                render json: { message: "error, #{newContent.errors.full_messages}"}, status: 412
            end 
        end 
    end 

    def index
        @url_contents = UrlContent.all
        render json: @url_contents.to_json, status: 200
    end

    private

        def url_params
            params.require(:url)
        end

end
