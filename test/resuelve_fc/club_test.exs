defmodule ResuelveFc.ClubTest do
  use ResuelveFc.DataCase

  alias ResuelveFc.Club

  describe "teams" do
    alias ResuelveFc.Club.Team

    @valid_attrs %{goals: 42, name: "some name", score_month: 42}
    @update_attrs %{goals: 43, name: "some updated name", score_month: 43}
    @invalid_attrs %{goals: nil, name: nil, score_month: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Club.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Club.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Club.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Club.create_team(@valid_attrs)
      assert team.goals == 42
      assert team.name == "some name"
      assert team.score_month == 42
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Club.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, %Team{} = team} = Club.update_team(team, @update_attrs)
      assert team.goals == 43
      assert team.name == "some updated name"
      assert team.score_month == 43
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Club.update_team(team, @invalid_attrs)
      assert team == Club.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Club.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Club.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Club.change_team(team)
    end
  end
end
