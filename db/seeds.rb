19.times do |i|
  BusinessEntity.create(name: "BusinessEntity ##{i+1}", name_short: "BE##{i+1}")
end
lead_sources = ["www.leaderssl.com", "newsite.instantssl.su", "www.leaderssl.nl", "www.leaderssl.com.ua", "www.leaderssl.sg", "www.leaderssl.de", "www.leaderssl.be", "www.leaderssl.fr", "www.leaderssl.co.uk", "ca.leaderssl.com", "www.leaderssl.us", "www.leaderssl.cz", "www.leaderssl.gr", "www.leaderssl.ie", "www.leaderssl.ch", "www.leaderssl.si", "www.leaderssl.es", "www.getucc.com", "www.getucc.com"]

9.times do |i|
  Lead.create(interested_company_id: i+1, lead_source: lead_sources[i], status: 'spam', created_at: "2015-06-#{i+1} 12:41:51")
end

19.times do |i|
  Lead.create(interested_company_id: i+1, lead_source: lead_sources[i], status: 'closed', created_at: "2015-01-#{i+1} 12:41:51")
end

10.times do |i|
  Lead.create(interested_company_id: i+1, lead_source: lead_sources[i], status: 'job_done', created_at: "2014-02-#{i+1} 12:41:51")
end

19.times do |i|
  Lead.create(interested_company_id: i+1, lead_source: lead_sources[i], status: 'spam', contract_id: i+1, created_at: "2014-11-#{i+1} 12:41:51")
end

14.times do |i|
  Lead.create(interested_company_id: i+1, lead_source: lead_sources[i], status: 'closed', contract_id: i+1, created_at: "2015-02-#{i+1} 12:41:51")
end

19.times do |i|
  Lead.create(interested_company_id: i+1, lead_source: lead_sources[i], status: 'job_done', contract_id: i+1, created_at: "2014-12-#{i+1} 12:41:51")
end