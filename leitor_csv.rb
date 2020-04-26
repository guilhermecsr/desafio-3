require 'csv'
require_relative 'aluno'

class LeitorCsv
  def initialize
    @arquivo = CSV.parse(File.read("notas.csv"), headers: true)
    le_dados_aluno
  end

  def le_dados_aluno
    result = {}
    @arquivo.each do |row|
      if result[:matricula => row[0]]
        result[:matricula => row[0]].push [{ row[1] => [:nota => row[3], :ch => row[4]] }]
      else
        result[:matricula => row[0]] = [[{ row[1] => [:nota => row[3], :ch => row[4]] }]]
      end
    end
    puts "CR dos alunos: "
    puts "Mat --- CR "
    puts ""
    result.each do |k, v|
      Aluno.new(k, v)
    end
  end

  def le_dados_curso
  end
end

LeitorCsv.new