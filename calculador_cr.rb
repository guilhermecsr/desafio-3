require 'csv'

class CalculadorCr
  def initialize
    ler_o_arquivo
  end
  def ler_o_arquivo
    tabela_de_info = CSV.parse(File.read("notas.csv"), headers: true)
    calcula_cr(tabela_de_info["NOTA"], tabela_de_info["CARGA_HORARIA"], tabela_de_info["MATRICULA"])
  end
  def calcula_cr(nota, carga, matricula)
    
    nota.map(&:to_i)
    carga.map(&:to_i)

  end
CalculadorCr.new
end