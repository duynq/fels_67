module CategoriesHelper
  def image_for category, height, width
    image_tag category.image, alt: category.name, height: height, width: width
  end
end
