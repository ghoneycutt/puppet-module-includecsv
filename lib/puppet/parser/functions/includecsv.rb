module Puppet::Parser::Functions
  newfunction(:includecsv, :type => :statement, :doc => <<-EOS
    Takes one argument, a string of comma separated classes and then includes
    each class. If the class does not start with '::' it will be prepended.
    EOS
  ) do |arg|

    raise(Puppet::ParseError, "includecsv(): Wrong # of args" +
      "given (#{arg.size} for 1)") if arg.size != 1

    raise(Puppet::ParseError, "includecsv(): Wrong data type. Expected string") if not arg[0].is_a?(String)

    classes = arg[0].split(',')
    classes.each do |_class|
      if _class =~ /^::/
        included_class = _class
      else
        included_class = "::#{_class}"
      end
      function_include([included_class])
    end
  end
end
