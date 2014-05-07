module BugherdClient
  module Resources
    class Comment < Base

      #
      # Get a paginated list of comments for a task.
      #
      def all(project_id, task_id)
        raw_response = get_request("projects/#{project_id}/tasks/#{task_id}/comments")
        parse_response(raw_response, :comments)
      end

      #
      # Create a comment
      # attributes: text, user_id or email
      def create(project_id, task_id, attributes={})
        raw_response = post_request("projects/#{project_id}/tasks/#{task_id}/comments", comment: attributes)
        parse_response(raw_response)
      end

    end
  end
end