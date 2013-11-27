module TasksHelper
  def status_to_label status
    if status
      content_tag :span, "Completed", class: "label label-success"
    else
      content_tag :span, "Active", class: "label label-primary"
    end
  end

  def status_label_for task
    status_to_label task.status
  end

  def check_box_with_status_for task
    form_for task, url: project_task_path(project_id: task.project_id, id: task), remote: true, html: { class: "form-inline status-toggle" } do |f|
        f.check_box(:status) + status_label_for(task)
    end
  end

  def render_markdown text
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true)
    @markdown.render(text).html_safe
  end

  def tasks_filter_select
    content_tag :div, class: "btn-group" do
      task_scopes_for_filter.map do |scope|
        link_to scope.titleize, project_tasks_path(filter: scope, page: params[:page]), class: "btn btn-sm btn-default"
      end.join.html_safe
    end
  end

  def task_scopes_for_filter
    ["all", "active", "completed"]
  end
end
