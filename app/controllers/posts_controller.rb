class PostsController < ApplicationController
    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post = Post.new
    end

    def reinstate_placeholder_text
        @post.custom_cover_letter.gsub!(@post.company_name, '[COMPANY]')
        @post.custom_cover_letter.gsub!(@post.position_title, '[POSITION]')
        @post.save
    end

    def toggle_placeholder_text(prev_company, new_company, prev_position, new_position)
        @post.custom_cover_letter.gsub!(prev_company, new_company)
        @post.custom_cover_letter.gsub!(prev_position, new_position)
        @post.save
    end

    def create
        @post = Post.new(post_params)

        self.toggle_placeholder_text('[COMPANY]', @post.company_name, '[POSITION]', @post.position_title)

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
        self.toggle_placeholder_text(@post.company_name, '[COMPANY]', @post.position_title, '[POSITION]' )
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(params[:post].permit(:company_name, :position_title, :job_description, :custom_cover_letter))
            self.toggle_placeholder_text('[COMPANY]', @post.company_name, '[POSITION]', @post.position_title)
            redirect_to @post
        else
            redirect_to 'edit'
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
