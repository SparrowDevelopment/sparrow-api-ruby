class TestBase < Minitest::Test
  def setup
    @env = {}
    ENV.each do |k, v|
      @env[k] = v
    end
  end
  
  def teardown
    ENV.each do |k, v|
      if(!@env.has_key?(k))
        ENV.delete(k)
      end
    end
    @env.each do |k,v|
      ENV[k] = @env[k]
    end
  end
end
