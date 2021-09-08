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

  describe "levels" do
    alias ResuelveFc.Personnel.Level

    @valid_attrs %{name: "some name", score_month: 42}
    @update_attrs %{name: "some updated name", score_month: 43}
    @invalid_attrs %{name: nil, score_month: nil}

    def level_fixture(attrs \\ %{}) do
      {:ok, level} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Personnel.create_level()

      level
    end

    test "list_levels/0 returns all levels" do
      level = level_fixture()
      assert Personnel.list_levels() == [level]
    end

    test "get_level!/1 returns the level with given id" do
      level = level_fixture()
      assert Personnel.get_level!(level.id) == level
    end

    test "create_level/1 with valid data creates a level" do
      assert {:ok, %Level{} = level} = Personnel.create_level(@valid_attrs)
      assert level.name == "some name"
      assert level.score_month == 42
    end

    test "create_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Personnel.create_level(@invalid_attrs)
    end

    test "update_level/2 with valid data updates the level" do
      level = level_fixture()
      assert {:ok, %Level{} = level} = Personnel.update_level(level, @update_attrs)
      assert level.name == "some updated name"
      assert level.score_month == 43
    end

    test "update_level/2 with invalid data returns error changeset" do
      level = level_fixture()
      assert {:error, %Ecto.Changeset{}} = Personnel.update_level(level, @invalid_attrs)
      assert level == Personnel.get_level!(level.id)
    end

    test "delete_level/1 deletes the level" do
      level = level_fixture()
      assert {:ok, %Level{}} = Personnel.delete_level(level)
      assert_raise Ecto.NoResultsError, fn -> Personnel.get_level!(level.id) end
    end

    test "change_level/1 returns a level changeset" do
      level = level_fixture()
      assert %Ecto.Changeset{} = Personnel.change_level(level)
    end
  end
end
