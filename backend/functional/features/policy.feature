@policy
Feature: policy
  Test policy-related APIs

  Scenario: Create a new policy
    Given I send "POST" request to "/v1/resources" with payload:
      """
      {"id": "post.123", "kind": "post", "value": "123"}
      """
    And the response code should be 200
    When I send "POST" request to "/v1/policies" with payload:
      """
      {
        "id": "my-post-123-policy",
        "resources": [
            "post.123"
        ],
        "actions": ["create"]
      }
      """
    Then the response code should be 200
    And the response should match json:
      """
      {
        "actions": [
          {
            "id": "create",
            "is_locked": false,
            "created_at": "2100-01-01T02:00:00+01:00",
            "updated_at": "2100-01-01T02:00:00+01:00"
          }
        ],
        "id": "my-post-123-policy",
        "resources": [
          {
            "id": "post.123",
            "kind": "post",
            "value": "123",
            "is_locked": false,
            "created_at": "2100-01-01T02:00:00+01:00",
            "updated_at": "2100-01-01T02:00:00+01:00"
          }
        ],
        "created_at": "2100-01-01T02:00:00+01:00",
        "updated_at": "2100-01-01T02:00:00+01:00"
      }
      """

  Scenario: Update a policy
    Given I send "POST" request to "/v1/resources" with payload:
      """
      {"id": "post.123", "kind": "post", "value": "123"}
      """
    And the response code should be 200
    And I send "POST" request to "/v1/resources" with payload:
      """
      {"id": "post.456", "kind": "post", "value": "456"}
      """
    And the response code should be 200
    And I send "POST" request to "/v1/policies" with payload:
      """
      {
        "id": "my-post-policy",
        "resources": [
            "post.123"
        ],
        "actions": ["create"]
      }
      """
    And the response code should be 200
    When I send "PUT" request to "/v1/policies/my-post-policy" with payload:
      """
      {
        "resources": [
            "post.456"
        ],
        "actions": ["update"]
      }
      """
    Then the response code should be 200
    And the response should match json:
      """
      {
        "id": "my-post-policy",
        "actions": [
          {
            "id": "update",
            "is_locked": false,
            "created_at": "2100-01-01T02:00:00+01:00",
            "updated_at": "2100-01-01T02:00:00+01:00"
          }
        ],
        "resources": [
          {
            "id": "post.456",
            "kind": "post",
            "value": "456",
            "is_locked": false,
            "created_at": "2100-01-01T02:00:00+01:00",
            "updated_at": "2100-01-01T02:00:00+01:00"
          }
        ],
        "created_at": "2100-01-01T02:00:00+01:00",
        "updated_at": "2100-01-01T02:00:00+01:00"
      }
      """

  Scenario: Retrieve a single policy
    Given I send "POST" request to "/v1/resources" with payload:
      """
      {"id": "post.123", "kind": "post", "value": "123"}
      """
    And the response code should be 200
    When I send "POST" request to "/v1/policies" with payload:
      """
      {
        "id": "my-post-123-policy",
        "resources": [
            "post.123"
        ],
        "actions": ["create"]
      }
      """
    And the response code should be 200
    When I send "GET" request to "/v1/policies/my-post-123-policy"
    Then the response code should be 200
    And the response should match json:
      """
      {
        "id": "my-post-123-policy",
        "actions": [
          {
            "id": "create",
            "is_locked": false,
            "created_at": "2100-01-01T02:00:00+01:00",
            "updated_at": "2100-01-01T02:00:00+01:00"
          }
        ],
        "resources": [
          {
            "id": "post.123",
            "kind": "post",
            "value": "123",
            "is_locked": false,
            "created_at": "2100-01-01T02:00:00+01:00",
            "updated_at": "2100-01-01T02:00:00+01:00"
          }
        ],
        "created_at": "2100-01-01T02:00:00+01:00",
        "updated_at": "2100-01-01T02:00:00+01:00"
      }
      """

  Scenario: Delete a single policy
    Given I send "POST" request to "/v1/resources" with payload:
      """
      {"id": "post.123", "kind": "post", "value": "123"}
      """
    And the response code should be 200
    When I send "POST" request to "/v1/policies" with payload:
      """
      {
        "id": "my-post-123-policy",
        "resources": [
            "post.123"
        ],
        "actions": ["create"]
      }
      """
    And the response code should be 200
    When I send "DELETE" request to "/v1/policies/my-post-123-policy"
    And the response code should be 200
    And the response should match json:
      """
      {
        "success": true
      }
      """
    And I send "GET" request to "/v1/policies/my-post-123-policy"
    And the response code should be 404

  Scenario: Retrieve a list of policies
    Given I send "POST" request to "/v1/resources" with payload:
      """
      {"id": "post.123", "kind": "post", "value": "123"}
      """
    And the response code should be 200
    And I send "POST" request to "/v1/policies" with payload:
      """
      {
        "id": "my-post-123-policy-1",
        "resources": [
            "post.123"
        ],
        "actions": ["create"]
      }
      """
    And the response code should be 200
    And I send "POST" request to "/v1/policies" with payload:
      """
      {
        "id": "my-post-123-policy-2",
        "resources": [
            "post.123"
        ],
        "actions": ["update"]
      }
      """
    And the response code should be 200
    When I send "GET" request to "/v1/policies"
    Then the response code should be 200
    And the response should match json:
      """
      {
        "data": [
          {
            "actions": [
              {
                "id": "create",
                "is_locked": false,
                "created_at": "2100-01-01T02:00:00+01:00",
                "updated_at": "2100-01-01T02:00:00+01:00"
              }
            ],
            "id": "my-post-123-policy-1",
            "resources": [
              {
                "id": "post.123",
                "kind": "post",
                "value": "123",
                "is_locked": false,
                "created_at": "2100-01-01T02:00:00+01:00",
                "updated_at": "2100-01-01T02:00:00+01:00"
              }
            ],
            "created_at": "2100-01-01T02:00:00+01:00",
            "updated_at": "2100-01-01T02:00:00+01:00"
          },
          {
            "actions": [
              {
                "id": "update",
                "is_locked": false,
                "created_at": "2100-01-01T02:00:00+01:00",
                "updated_at": "2100-01-01T02:00:00+01:00"
              }
            ],
            "id": "my-post-123-policy-2",
            "resources": [
              {
                "id": "post.123",
                "kind": "post",
                "value": "123",
                "is_locked": false,
                "created_at": "2100-01-01T02:00:00+01:00",
                "updated_at": "2100-01-01T02:00:00+01:00"
              }
            ],
            "created_at": "2100-01-01T02:00:00+01:00",
            "updated_at": "2100-01-01T02:00:00+01:00"
          }
        ],
        "page": 0,
        "size": 100,
        "total": 2
      }
      """