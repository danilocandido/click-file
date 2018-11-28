module FileSystemsHelper
  def nested_attributes(attributes)
    content_tag :ul do
      attributes.each do |attribute|
        #concat(content_tag(:li, attribute.name))

        #
        concat render(partial: 'file', locals: { file_system: attribute })

        #link = link_to(new_file_system_path(attribute)) do
        #  content_tag(:li, attribute.name)
        #end
        #concat(link)
        #

        if attribute.children?
          concat(nested_attributes(attribute.files))
        end
      end
    end
  end
end
