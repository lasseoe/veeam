require 'unirest'
require 'nokogiri'

require './config.rb'

em_url = VeeamConfig::EM_HOST + ":" + VeeamConfig::EM_PORT.to_s

response = Unirest.post(em_url + "/api/sessionMngr/?v=v1_3", auth:{:user=>VeeamConfig::EM_USER, :password=>VeeamConfig::EM_PASSWORD})

#puts response.code
headers = response.headers
auth = headers[:x_restsvcsessionid]
Unirest.default_header('X-RestSvcSessionId',auth)

# Find URI for session logout
logoutdoc = Nokogiri::XML(response.body,nil,'utf-8')
logoutdoc.remove_namespaces!
logouturl = logoutdoc.at_xpath('//Link[@Rel="Delete"]/@Href').to_s

# Retrieve tenants
#response = Unirest.get(em_url + "/api/cloud/tenants?format=Entity&sortAsc=Name")
response = Unirest.get(em_url + "/api/query?type=cloudtenant&format=entities&sortAsc=Name")

doc = Nokogiri::XML(response.body,nil,'utf-8')
doc.remove_namespaces!

# Print header
printf("%-14s %-30s %6s %6s %4s %-5s %-7s %s\n", "Name", "Description", "Quota", "Used", "VMs", "Enab", "Last", "Last active")

nodes = doc.xpath("//CloudTenant")
nodes.each do |node|
  printf("%-14s %-30s %6d %6d %4d %-5s %-7s %s\n", node.attr("Name").to_s,
                                                   node.xpath("Description").text.to_s.slice(0..29),
                                                   node.xpath("Resources/CloudTenantResource/RepositoryQuota/Quota").text.to_i/1024,
                                                   node.xpath("Resources/CloudTenantResource/RepositoryQuota/UsedQuota").text.to_i/1024,
                                                   node.xpath("BackupCount").text.to_i,
                                                   node.xpath("Enabled").text.to_s,
                                                   node.xpath("LastResult").text.to_s,
                                                   node.xpath("LastActive").text.to_s )
end


# Logout
response = Unirest.delete(logouturl)
#puts response.code


