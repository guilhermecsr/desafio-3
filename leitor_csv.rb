require 'csv'
require_relative 'aluno'
require_relative 'curso'
require 'pry'

class LeitorCsv
  def initialize
    @arquivo = CSV.parse(File.read("notas.csv"), headers: true)
    imprime
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
    puts "* * * * * *"
    puts "Média de CR dos cursos"
    puts "Cur --- Média CR"
    puts ""
    reune_dados

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
    hash_curso_matricula.each do |k, v|
      Curso.new(k, v)
    end
    hash_curso_matricula
  end

  def reune_dados
    crs = []
    le_dados_aluno.each do |k, v|
      crs << (Aluno.new(k, v).retorna_dados)
    end
    cursos = []
    le_dados_curso_matricula.each do |k, v|
      cursos << (Curso.new(k, v.flatten.uniq).retorna_dados)
    end
    formata_dados(crs, cursos)
  end

  def formata_dados(crs, cursos)
    hash = {}

    cursos.each do |a|
      a.values[0].each do |b|
        crs.each do |c|
          if b == c.keys[0].values[0]
            if hash[[:cod_curso] => a.keys[0].values[0]]
              hash[[:cod_curso] => a.keys[0].values[0]] << [[:matricula] => b, [:cr] => c.values[0]]
            else
              hash[[:cod_curso] => a.keys[0].values[0]] = [[[:matricula] => b, [:cr] => c.values[0]]]
            end
            # puts "#{b}   #{c.keys[0].values[0]} #{a.keys[0].values[0]} #{c.values[0]}"
          end
        end
      end
    end
    media(hash)
  end

  def media(hash)
    array = []
    hash.each do |d, l|
      l.each do |e|
        array << e[0].values[1]
      end
      denominador = array.length
      numerador = array.sum
      puts "#{d.values[0]} --- #{numerador/denominador}"
      # binding.pry
      array = []
    end
  end



end

LeitorCsv.new