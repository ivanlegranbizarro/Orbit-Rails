# frozen_string_literal:true

module ApplicationHelper
  # Returns a full title on a per page basis

  # Method definition, optional argument
  def full_title(page_title = ' ')
    # Creating and assigning a variable
    base_title = 'Orbit Feedback Application'
    # Boolean test
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
