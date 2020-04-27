require 'csv'
require 'pry'

class CalculadorCr
  def initialize(value)
    @value = value
  end

  def calcula_cr
    # CR = Nota(i)*CargaHoraria(i)/TotalCargaHoraria
    cht = []
    ntch = []
    @value.each do |d|
      nt = d[0].values[0][0].values[0].to_i
      ch = d[0].values[0][0].values[1].to_i
      cht << d[0].values[0][0].values[1]
      ntch << nt*ch
    end
    cht = cht.map(&:to_i)
    ch_total = cht.sum
    ntch.sum/ch_total
  end
end

