require 'csv'
require_relative 'aluno'
require_relative 'curso'
require 'pry'

class LeitorCsv
  def initialize
    @arquivo = CSV.parse(File.read("notas.csv"), headers: true)
    # imprime
    teste
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
    result
  end

  def imprime
    puts "CR dos alunos: "
    puts "Mat --- CR "
    puts ""

    le_dados_aluno.each do |k, v|
      Aluno.new(k, v).exibe_cr
    end
    puts "* * * * * *"
    puts "CR dos cursos"
    puts "Cur --- CR"
    puts ""
    le_dados_curso.each do |k, v|
      Curso.new(k, v).exibe_cr
    end

  end

  def le_dados_curso
    hash_curso = {}
    @arquivo.each do |row|
      if hash_curso[:cod_curso => row[2]]
        hash_curso[:cod_curso => row[2]].push [{ row[1] => [:nota => row[3], :ch => row[4]] }]
      else
        hash_curso[:cod_curso => row[2]] = [[{ row[1] => [:nota => row[3], :ch => row[4]] }]]
      end
    end
    hash_curso
  end

  def le_dados_curso_matricula
    hash_curso_matricula = {}
    @arquivo.each do |row|
      if hash_curso_matricula[:cod_curso => row[2]]
        hash_curso_matricula[:cod_curso => row[2]].push [row[0]]
      else
        hash_curso_matricula[:cod_curso => row[2]] = [row[0]]
      end
    end

    puts "* * * * * *"
    puts "CR dos cursos"
    puts "Cur --- CR"
    puts ""
    hash_curso_matricula.each do |k, v|
      Curso.new(k, v)
    end
    puts hash_curso_matricula
    hash_curso_matricula
  end

  def teste
    crs = []
    le_dados_aluno.each do |k, v|
      crs << (Aluno.new(k, v).retorna_dados)
    end

    cursos = []
    le_dados_curso_matricula.each do |k, v|
      cursos << (Curso.new(k, v.flatten.uniq).retorna_dados)
    end

    def media


    end
    # binding.pry
  end
end

LeitorCsv.new