class Output
  def table(input)
    print '     '
    input.each { |i| print format('%-6d', i) }
    print "\n     "
    print '-' * input.size * 6
    print "\n"

    input.each do |j|
      print format('%-3d| ', j)
      input.each { |i| print format('%-4d  ', (i * j)) }
      print "\n"
    end
  end
end
