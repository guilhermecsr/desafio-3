require 'csv'
require_relative 'aluno'
require_relative 'curso'

class LeitorCsv
  def initialize
    @arquivo = CSV.parse(File.read("notas.csv"), headers: true)
    le_dados_aluno
    le_dados_curso
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
    hash_curso = {}
    @arquivo.each do |row|
      # binding.pry
      if hash_curso[:cod_curso => row[2]]
        hash_curso[:cod_curso => row[2]].push [{ row[1] => [:nota => row[3], :ch => row[4]] }]
      else
        hash_curso[:cod_curso => row[2]] = [[{ row[1] => [:nota => row[3], :ch => row[4]] }]]
      end
    end
    puts "* * * * * *"
    puts "CR dos cursos"
    puts "Cur --- CR"
    puts ""
    hash_curso.each do |k, v|
      Curso.new(k, v)
    end
  end
end

LeitorCsv.new