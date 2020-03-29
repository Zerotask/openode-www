class Admin::InstanceAccessController < Admin::InstancesController
  skip_forgery_protection only: [:cmd]

  before_action do
    add_breadcrumb "Instances",
                   admin_instances_path,
                   title: "Instances"
  end

  def index
    redirect_to({ action: :deployments })
  end

  def deployments
    add_breadcrumb "Deployments",
                   admin_instance_access_deployments_path,
                   title: "Deployments"

    @deployments = api(:get, "/instances/#{@instance_id}/executions/list/Deployment")
  end

  def deployment
    add_breadcrumb "Deployments",
                   admin_instance_access_deployments_path,
                   title: "Deployments"

    @deployment_id = params[:deployment_id]

    @deployment = api(:get, "/instances/#{@instance_id}/executions/#{@deployment_id}")
  end

  def activity_stream
    add_breadcrumb "Activity Stream",
                   admin_instance_access_activity_stream_path,
                   title: "Activity Stream"

    @events = api(:get, "/instances/#{@instance_id}/events")
  end

  def event
    add_breadcrumb "Activity Stream",
                   admin_instance_access_activity_stream_path,
                   title: "Activity Stream"

    @event = api(:get, "/instances/#{@instance_id}/events/#{params[:event_id]}")
  end

  def console
    add_breadcrumb "Console",
                   admin_instance_access_console_path,
                   title: "Console"

    @doc_link = "/docs/platform/exec.md"
  end

  def cmd
    cmd = params[:cmd]

    result = begin
      api(:post, "/instances/#{@instance_id}/cmd", payload: { cmd: cmd })
             rescue StandardError => e
               {
                 'result' => {
                   'stdout' => "There was an issue processing the command. #{e}"
                 }
               }
    end

    render json: { msg: result&.dig('result') }
  end
end
