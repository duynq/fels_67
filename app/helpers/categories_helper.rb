module CategoriesHelper
  def image_for category, height, width
    image_url = category.image
    image_tag image_url, alt: category.name, height: height, width: width, class: "gravatar img-rounded"
  end
end
