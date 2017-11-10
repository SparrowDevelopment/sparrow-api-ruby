class SparrowOne::TestRunner
  def self.run(options)
    self.new(options).run
  end

  def initialize(options)
    @verbose = options[:verbose]
  end

  def fault(explanation, method, params, matcher = //)
      puts "--    Fault: #{explanation}\n      (#{self.api.class}##{method})" unless @verbose
  end

  def specify(method, params, matcher = /success/i)
    response = api.send(method, params)
    if response['textresponse'].match(matcher) || response.success?
      if @verbose
        puts example_of(method, params, response) if matcher == /success/i
      else
        puts "OK    #{self.api.class}##{method}"
      end
    else
      puts "XX    Unexpected error in #{self.api.class}##{method}: received #{response.to_json}"
      puts "      Params: #{params}"
    end
    response
  end

  def example_of(method, params, result)
    "\n#{self.api.class}##{method}\napi.#{method}(#{params})\n #=> #{result.parsed_response}\n"
  end

  def log(response, matcher = /success/i, long_notice = "" )
    puts caller
  end
end
