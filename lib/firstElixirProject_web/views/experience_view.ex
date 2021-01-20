defmodule FirstElixirProjectWeb.ExperienceView do
  use FirstElixirProjectWeb, :view
  alias FirstElixirProjectWeb.ExperienceView

  def render("index.json", %{experience: experience}) do
    %{data: render_many(experience, ExperienceView, "experience.json")}
  end

  def render("show.json", %{experience: experience}) do
    %{data: render_one(experience, ExperienceView, "experience.json")}
  end

  def render("experience.json", %{experience: experience}) do
    %{
      id: experience.id,
      companyName: experience.companyName,
      description: experience.description,
      from: experience.from,
      till: experience.till
    }
  end
end
