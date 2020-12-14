defmodule Exgit.ClientTest do
  use ExUnit.Case

  import Tesla.Mock

  describe "get_repos_by_username/1" do
    test "when the user has repos, returns the repos" do
      username = "leandrosoares6"

      response = [
        %{"id" => 1, "name" => "my_repo1"},
        %{"id" => 2, "name" => "my_repo2"}
      ]

      expected_response = {:ok, response}

      mock(fn %{method: :get, url: "https://api.github.com/users/leandrosoares6/repos"} ->
        %Tesla.Env{status: 200, body: response}
      end)

      assert Exgit.Client.get_repos_by_username(username) == expected_response
    end
  end
end
