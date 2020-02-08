
module HttpStubs
  def self.all(logged_in_user_token)
    [
      {
        url: 'https://api.openode.io/account/getToken',
        method: :post,
        with: {
          body: { 'email' => 'mymail@openode.io', 'password' => '1234561!' }
        },
        content_type: 'application/json',
        response_status: 200,
        response_path: 'test/fixtures/http/openode_api/front/get_token_exists.json'
      },
      {
        url: 'https://api.openode.io/account/getToken',
        method: :post,
        with: {
          body: { 'email' => 'invalid@openode.io', 'password' => '123456' }
        },
        content_type: 'application/json',
        response_status: 404,
        response_path: 'test/fixtures/http/openode_api/front/get_token_not_exists.json'
      },
      {
        url: 'https://api.openode.io/account/register',
        method: :post,
        with: {
          body: {
            account: {
              'email' => 'myadminvalidregister@thisisit.com',
              'password' => 'Helloworld234',
              'password_confirmation' => 'Helloworld234',
              'newsletter' => '0'
            }
          }
        },
        content_type: 'application/json',
        response_status: 200,
        response_path: 'test/fixtures/http/openode_api/front/users_create.json'
      },
      {
        url: 'https://api.openode.io/account/register',
        method: :post,
        with: {
          body: {
            account: {
              'email' => 'myadminvalidregister@thisisit.com',
              'password' => 'Helloworld234',
              'password_confirmation' => 'Helloworld234567'
            }
          }
        },
        content_type: 'application/json',
        response_status: 422,
        response_path:
          'test/fixtures/http/openode_api/front/users_create_validation_issue.json'
      },
      {
        url: 'https://api.openode.io/global/stats',
        method: :get,
        with: {
          body: {}
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/front/global_stats.json'
      },
      {
        url: 'https://api.openode.io/account/forgot-password',
        method: :post,
        with: {
          body: {}
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/front/forgot-password.json'
      },
      {
        url: 'https://api.openode.io/account/verify-reset-token',
        method: :post,
        with: {
          body: {
            "reset_token" => "theresettoken"
          }
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/front/forgot-password.json'
      },
      {
        url: 'https://api.openode.io/open_source_projects/latest',
        method: :get,
        with: {
          body: {}
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/front/open_source_projects_latest.json'
      },
      {
        url: 'https://api.openode.io/open_source_project/test1234568',
        method: :get,
        with: {
          body: {}
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/front/open_source_project_test1234568.json'
      },
      {
        url: 'https://api.openode.io/super_admin/support/contact',
        method: :post,
        with: {
          body: {
            "email" => "hello@world.com",
            "message" => "im interested"
          }
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/front/support-contact.json',
        headers: {
          'X-Auth-Token' => logged_in_user_token
        }
      },
      {
        url: 'https://api.openode.io/notifications/?limit=5',
        method: :get,
        with: {
          body: {}
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/admin/dropdown-notifications.json',
        headers: {
          'X-Auth-Token' => logged_in_user_token
        }
      },
      {
        url: 'https://api.openode.io/notifications/?limit=1&types=GlobalNotification',
        method: :get,
        with: {
          body: {}
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/admin/latest-global-notifications.json',
        headers: {
          'X-Auth-Token' => logged_in_user_token
        }
      },
      {
        url: 'https://api.openode.io/instances/summary',
        method: :get,
        with: {
          body: {}
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/admin/instances-summary.json',
        headers: {
          'X-Auth-Token' => logged_in_user_token
        }
      },
      {
        url: 'https://api.openode.io/global/available-plans',
        method: :get,
        with: {
          body: {}
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/admin/available-plans.json',
        headers: {
          'X-Auth-Token' => logged_in_user_token
        }
      },
      {
        url: 'https://api.openode.io/global/available-locations?type=kubernetes',
        method: :get,
        with: {
          body: {}
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/admin/available-locations.json',
        headers: {
          'X-Auth-Token' => logged_in_user_token
        }
      },
      {
        url: 'https://api.openode.io/instances/create',
        method: :post,
        with: {
          body: { "account_type" => "subdomain" }
        },
        content_type: 'application/json',
        response_status: 200,
        response_path:
          'test/fixtures/http/openode_api/admin/create-instance.json',
        headers: {
          'X-Auth-Token' => logged_in_user_token
        }
      }
    ]
  end
end
