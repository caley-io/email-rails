module ApplicationHelper
  def active_page?(link_path)
    current_page?(link_path) ? "bg-highlight-light dark:bg-highlight-dark dark:text-white" : ""
  end

  # TODO: Add user setting for 24hr/12hr time format
  def format_date(created_at)
    if created_at.to_date == Date.today
      created_at.strftime("%H:%M %p")
    else
      created_at.strftime("%b %d")
    end
  end

  def header_title(page_title)
    content_for(:header_title) { page_title }
  end

  def permitted_accountable_partial(name)
    name.underscore
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  # Wrap view with <%= modal do %> ... <% end %> to have it open in a modal
  # Make sure to add data-turbo-frame="modal" to the link/button that opens the modal
  def modal(&)
    render("shared/base", &)
  end
end
