class SparrowOne::TestRunner
  def self.run(options)
    self.new(options).run
  end

  def initialize(options)
    @verbose = options[:verbose]
  end

  def specify(method, params, matcher = /success/i)
    response = api.send(method, params)
    if response['textresponse'].match(matcher) || response.success?
      if @verbose
        puts example_of(method, params, response) if matcher == /success/i
      else
        puts "OK"
      end
    else
      puts "**Fault in #{self.api.class}::#{method}: received #{response.to_json}"
    end
    response
  end

  def example_of(method, params, result)
    "\n#{self.api.class}##{method}\napi.#{method}(#{params})\n #=> #{result.parsed_response}\n"
  end

  def log(response, matcher = /success/i, long_notice = "" )
    if @verbose
      puts response.to_json
    end
    if response['textresponse'].match matcher
      if long_notice == ""
        puts "  OK"
      else
        puts "  OK (" + long_notice + ")"
      end
    else
      puts "--Fault: Expected #{response['textresponse']} to match #{matcher.to_s}"
    end
  end
end
