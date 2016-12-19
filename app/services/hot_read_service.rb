class HotReadService
  def self.read(link)
    link.update_attribute(:read, true)
    conn = Faraday.new(url: 'http://localhost:2000')
    conn.post('/api/v1/reads', {url: link.url} )
  end
end
