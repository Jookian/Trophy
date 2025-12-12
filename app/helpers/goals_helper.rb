module GoalsHelper
  def goal_image_filename(name)
    slug = name.parameterize(separator: "_")
    "goal_#{slug}.jpg"
  end
end
