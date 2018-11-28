module FileSystemsHelper
  def nested_attributes(attributes)
    content_tag :ul do
      attributes.each do |attribute|
        concat(content_tag(:li, attribute.name))
        if attribute.children?
          concat(nested_attributes(attribute.files))
        end
      end
    end
  end
end
