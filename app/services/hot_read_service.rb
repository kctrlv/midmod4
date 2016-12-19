class HotReadService
  def self.conn
    Faraday.new(:url => 'localhost:2000')
  end

  def self.read(link)
    link.update_attribute(:read, true)
    conn.post('/api/v1/reads', {url: link.url} )
  end
end
