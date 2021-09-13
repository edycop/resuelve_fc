defmodule ResuelveFcWeb.SalaryView do
  use ResuelveFcWeb, :view
  alias ResuelveFcWeb.SalaryView

  def render("show.json", %{salary: salary}) do
    %{data: render_one(salary, SalaryView, "salary.json")}
  end

  def render("salary.json", %{salary: salary}) do
    %{ #id: salary.id,
      bonus: salary.bonus,
      base_salary: salary.base_salary,
      full_salary: salary.full_salary
    }
  end

end
