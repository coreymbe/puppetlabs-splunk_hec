Puppet::Functions.create_function(:'deployments::sh_hec_post') do
  dispatch :sh_hec_post do
    required_param 'String', :splunk_url
    required_param 'String', :hec_token
    required_param 'String', :jobhw_hostname
    required_param 'Tuple', :ia_report
  end

  require 'json'
  require 'net/http'
  require 'uri'

  def sh_hec_post(splunk_url, hec_token, jobhw_hostname, ia_report)
    uri = URI.parse(splunk_url)
    ia_report.each do |i|
      report = {
        'host' => jobhw_hostname,
        'sourcetype' => 'puppet:cd4pe',
        'event' => i,
      }
      Net::HTTP.start(
          uri.host,
          uri.port,
          use_ssl: true,
          verify_mode: OpenSSL::SSL::VERIFY_NONE,
        ) do |http|
        request = Net::HTTP::Post.new(uri)
        request.add_field('Authorization', "Splunk #{hec_token}")
        request.add_field('Content-Type', 'application/json')
        request.body = report.to_json
        http.request request
      end
    end
  end
end
