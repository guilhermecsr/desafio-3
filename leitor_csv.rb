require 'csv'
require_relative 'aluno'
require_relative 'curso'
require 'pry'
require_relative 'formatador_dados'
=begin
calsse para ler os dados do csv e cada metodo extrai a informacao necessaria
para cada objetivo retornando um hash com os valores necessarios
=end
class LeitorCsv
  def initialize
    @arquivo = CSV.parse(File.read("notas.csv"), headers: true)
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
end