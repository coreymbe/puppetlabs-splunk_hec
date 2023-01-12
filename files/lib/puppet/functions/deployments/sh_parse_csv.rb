Puppet::Functions.create_function(:'deployments::sh_parse_csv') do
  dispatch :sh_parse_csv do
    required_param 'String', :impact_analysis
  end

  require 'csv'

  def sh_parse_csv(impact_analysis)
    CSV.new(impact_analysis, headers: true).map(&:to_h)
  end
end
