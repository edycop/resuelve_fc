defmodule ResuelveFc.PersonnelTest do
  use ResuelveFc.DataCase

  alias ResuelveFc.Personnel

  describe "salaries" do
    alias ResuelveFc.Personnel.Salary

    @valid_attrs %{base_salary: 120.5, bonus: 120.5, full_salary: 120.5}
    @update_attrs %{base_salary: 456.7, bonus: 456.7, full_salary: 456.7}
    @invalid_attrs %{base_salary: nil, bonus: nil, full_salary: nil}

    def salary_fixture(attrs \\ %{}) do
      {:ok, salary} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Personnel.create_salary()

      salary
    end

    test "list_salaries/0 returns all salaries" do
      salary = salary_fixture()
      assert Personnel.list_salaries() == [salary]
    end

    test "get_salary!/1 returns the salary with given id" do
      salary = salary_fixture()
      assert Personnel.get_salary!(salary.id) == salary
    end

    test "create_salary/1 with valid data creates a salary" do
      assert {:ok, %Salary{} = salary} = Personnel.create_salary(@valid_attrs)
      assert salary.base_salary == 120.5
      assert salary.bonus == 120.5
      assert salary.full_salary == 120.5
    end

    test "create_salary/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Personnel.create_salary(@invalid_attrs)
    end

    test "update_salary/2 with valid data updates the salary" do
      salary = salary_fixture()
      assert {:ok, %Salary{} = salary} = Personnel.update_salary(salary, @update_attrs)
      assert salary.base_salary == 456.7
      assert salary.bonus == 456.7
      assert salary.full_salary == 456.7
    end

    test "update_salary/2 with invalid data returns error changeset" do
      salary = salary_fixture()
      assert {:error, %Ecto.Changeset{}} = Personnel.update_salary(salary, @invalid_attrs)
      assert salary == Personnel.get_salary!(salary.id)
    end

    test "delete_salary/1 deletes the salary" do
      salary = salary_fixture()
      assert {:ok, %Salary{}} = Personnel.delete_salary(salary)
      assert_raise Ecto.NoResultsError, fn -> Personnel.get_salary!(salary.id) end
    end

    test "change_salary/1 returns a salary changeset" do
      salary = salary_fixture()
      assert %Ecto.Changeset{} = Personnel.change_salary(salary)
    end
  end
end
