class PostsController < ApplicationController
    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        @post.custom_cover_letter.gsub!('[COMPANY]', @post.company_name)
        @post.custom_cover_letter.gsub!('[POSITION]', @post.position_title)

        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(params[:post].permit(:company_name, :position_title, :job_description, :custom_cover_letter))
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to root_path
    end

    private
        def post_params
            params.require(:post).permit(:company_name, :position_title, :job_description, :custom_cover_letter)
        end
end
