class HotReadService
  def self.read(link)
    link.update_attribute(:read, true)
    conn = Faraday.new(url: 'http://midmod-hotreads.herokuapp.com')
    conn.post('/api/v1/reads', {url: link.url} )
  end
end
