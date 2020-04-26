require 'csv'
require_relative 'aluno'

class LeitorCsv
  def initialize
    @arquivo = CSV.parse(File.read("notas.csv"), headers: true)
    arquivo
  end

  def arquivo
    result = {}
    @arquivo.each do |row|
      if result[:matricula => row[0]]
        result[:matricula => row[0]].push [{ row[1] => [:nota => row[3], :ch => row[4]] }]
      else
        result[:matricula => row[0]] = [ { row[1] => [:nota => row[3], :ch => row[4]] } ]
      end
    end
    puts result
    #   Aluno.new(result)
  end
end

LeitorCsv.new