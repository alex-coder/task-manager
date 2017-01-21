module TaskHelper
  def render_attach(task)
    if task.attachment.image?
      image_tag task.attachment, alt: task.name, class: 'img-responsive'
    else
      link_to task.attachment_identifier, task.attachment.url
    end
  end
end
