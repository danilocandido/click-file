module FileSystemsHelper
  def nested_attributes(attributes)
    content_tag :ul do
      attributes.each do |attribute|
        concat render(partial: 'file', locals: { file_system: attribute })
        if attribute.children?
          concat(nested_attributes(attribute.children))
        end
      end
    end
  end
end
