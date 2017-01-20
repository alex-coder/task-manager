module TaskHelper

  def status_class(state)
    case state.to_sym
    when :new then 'warning'
    when :started then 'success'
    when :finished then 'info'
    end
  end

  def render_attach(task)
    if task.attachment.image?
      image_tag task.attachment, alt: task.name, class: 'img-responsive'
    else
      link_to task.attachment_identifier, task.attachment.url
    end
  end
end
