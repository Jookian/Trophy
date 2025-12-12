module CategoriesHelper
  def category_image_filename(name)
    slug = name.parameterize(separator: "_")
    "category_#{slug}.jpg"
  end
end
