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
      else
        ENV[k] = @env[k]
      end
    end
  end
  
  def test_connection_fails_with_no_key
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
    ENV[Connection::ENV_MKEY_NAME]='123'
    c = Connection.new
    assert_equal '123', c.mkey
  end

end
