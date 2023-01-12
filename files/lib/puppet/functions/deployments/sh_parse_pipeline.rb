Puppet::Functions.create_function(:'deployments::sh_parse_pipeline') do
  dispatch :sh_parse_pipeline do
    required_param 'Hash', :pipeline_hash
  end

  def sh_parse_pipeline(pipeline_hash)
    ia_reports = []

    pipeline_hash['stages'].each do |stage|
      next unless stage.key?('destinations')
      stage['destinations'].each do |dest|
        next unless dest.key?('peImpactAnalysisEvent')
        ia_reports.push(dest['peImpactAnalysisEvent']['impactAnalysisId'])
      end
    end

    ia_reports
  end
end
