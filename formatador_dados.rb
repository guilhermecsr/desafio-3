require_relative 'aluno'
require_relative 'curso'
require 'csv'
require_relative 'calculador_media'

class FormatadorDados
  def initialize(dados_aluno, dados_cursos_matricula)
    @dados_aluno = dados_aluno
    @dados_cursos_matricula = dados_cursos_matricula
    reune_dados
  end

  def reune_dados
    crs = []
    @dados_aluno.each do |k, v|
      crs << (Aluno.new(k, v).retorna_dados)
    end
    cursos = []
    @dados_cursos_matricula.each do |k, v|
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
          end
        end
      end
    end
    CalculadorMedia.new(hash)
  end
end