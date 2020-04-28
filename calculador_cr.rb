require 'csv'
require 'pry'
#classe para calcular o cr
class CalculadorCr
  def initialize(value)
    @value = value
  end

  def calcula_cr
    # CR = Nota(i)*CargaHoraria(i)/TotalCargaHoraria
    cht = []
    ntch = []
    @value.each do |disc|
      nt = disc[0].values[0][0].values[0].to_i
      ch = disc[0].values[0][0].values[1].to_i
      cht << disc[0].values[0][0].values[1]
      ntch << nt*ch
    end
    cht = cht.map(&:to_i)
    ch_total = cht.sum
    ntch.sum/ch_total
  end
end
