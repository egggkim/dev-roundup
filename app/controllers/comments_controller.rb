class CommentsController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    comment = project.comments.create(comment_params)
    redirect_to project_path(comment.project)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, commenter_attributes: [:name, :email])
  end
end
