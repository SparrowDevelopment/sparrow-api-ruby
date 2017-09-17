require "test_helper"

include Sparrow

class SparrowTest < Minitest::Test
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
  
  def test_connection_fails_with_no_key
    ENV.delete(Connection::DEFAULTS[:env_mkey_name])
    assert_raises ConnectionError do
      Connection.new
    end
  end
  
  def test_connection_succeeds_with_mkey
    Connection.new(:mkey=>'123')
  end
  
  def test_connection_invalid_mkey
    assert_raises ConnectionError do
      Connection.new(:mkey=>123)
    end
  end

  def test_connection_empty_mkey
    assert_raises ConnectionError do
      Connection.new(:mkey=>'')
    end
    assert_raises ConnectionError do
      Connection.new(:mkey=>'   ')
    end
  end

  def test_connection_env_mkey
    ENV[Connection::DEFAULTS[:env_mkey_name]]='123'
    c = Connection.new
    assert_equal '123', c.config[:mkey]
  end

  def test_connection_dotenv
    c = Connection.new
    assert_equal '123', c.config[:mkey]
  end

  def test_connection_endpoint_and_timeout
    c = Connection.new
    assert_equal Connection::DEFAULTS[:api_endpoint], c.config[:api_endpoint]
    assert_equal Connection::DEFAULTS[:mkey], c.config[:mkey]
    assert_equal Connection::DEFAULTS[:timeout], c.config[:timeout]
  end

end
