# This deployment policy will send the results of Impact Analysis reports
# to Splunk's HTTP Event Collector endpoint.
#
# @summary This deployment policy will send the results of Impact Analysis reports
#          to Splunk's HTTP Event Collector endpoint.
#
# @param splunk_url
#     Full URL to the Splunk HEC endpoint where reports will be sent.
# @param hec_token
#     The Splunk HEC token configured for use with the Puppet Report Viewer app for Splunk.
# @param [Optional[String]] jobhw_hostname
#   Hostname of the agent node configured as the CD4PE Job Hardware.
#
plan deployments::splunk_hec (
  String           $splunk_url,
  String           $hec_token,
  Optional[String] $jobhw_hostname = 'cd4pe-job-hardware',
){
  # Set CD4PE environment variables.
  $repo_type         = system::env('REPO_TYPE')
  $control_repo_name = system::env('CONTROL_REPO_NAME')
  $module_name       = system::env('MODULE_NAME')
  $pipeline_id       = system::env('CD4PE_PIPELINE_ID')

  $repo_name = $repo_type ? {
    'CONTROL_REPO' => $control_repo_name,
    'MODULE' => $module_name
  }

  # Parse the Pipeline data hash to build an array of Impact Analysis report IDs.
  $pipeline = cd4pe_deployments::get_pipeline($repo_type, $repo_name, $pipeline_id)
  $pipeline_hash = cd4pe_deployments::evaluate_result($pipeline)
  $ia_id = deployments::sh_parse_pipeline($pipeline_hash)

  if ($ia_id == []){
    fail_plan('Unable to find any Impact Analysis stages.')
  }

  # Parse each Impact Analysis report CSV and post data to Splunk as separate events.
  $ia_id.each | Integer $id | {
    $ia_csv = cd4pe_deployments::get_impact_analysis_csv($id)
    $ia_csv_hash = cd4pe_deployments::evaluate_result($ia_csv)

    $ia_csv_report = $ia_csv_hash['csv'] ? {
      ''      => "message\nCD4PE Impact Analysis did not detect any resource changes.",
      default => $ia_csv_hash['csv'],
    }

    $ia_report = deployments::sh_parse_csv($ia_csv_report.convert_to(String))
    cd4pe_deployments::create_custom_deployment_event("Exporting Impact Analysis Report #${id} to Splunk.")
    deployments::sh_hec_post($splunk_url,$hec_token,$jobhw_hostname,$ia_report)
    cd4pe_deployments::create_custom_deployment_event("Successfully exported Impact Analysis Report #${id} to Splunk.")
  }
}
