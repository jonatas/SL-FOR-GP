=begin
help = {
  "PV – Planned Value" => 
     "É o valor estimado do trabalho planejado a realizar até uma data determinada.
      Por exemplo, se um projeto tem um orçamento de R$ 100.000,00
      para realizar em um prazo de 12 meses, então o mês 6 representará o 50% do trabalho do projeto, 
      portanto, o PV para o mês 6 será de R$ 50.000,00",

  "EV - Earned Value" => 
      "É o valor planejado do trabalho realmente completado até uma data determinada.
       Por exemplo, se um projeto tem um orçamento de R$ 100.000,00 
       e o trabalho completado em uma data determinada representa o 25% do projeto completo, 
       o EV será de R$ 25.000",

  "AC - Actual Cost" =>
      "É o gasto real incorrido para o trabalho realmente completado 
       Por exemplo, se um projeto tem um orçamento de R$ 100.000,00 
       e o gasto real até uma determinada data foi de R$ 35.000,00 
       o AC do projeto é de R$ 35.000,00",
        
  "BAC - Budget at Completion" => "Orçamento total do projeto",

  "ETC - Estimate to completion" => "Estimativa para terminar",

  "EAC - Estimate at complete" => "Quanto espero gastar ao final do projeto. 
       Ou seja, baseado na experiência do projeto qual será o custo final. 
       Há várias formulas diferentes para calcular o EAC",

  "SV - Scheduled Variation" => "Variação do Cronograma/Prazos
       SV é a diferença, em termos de custos, entre o Valor Agregado (EV) 
       e a agenda da linha de base (PV). Se SV for positiva, estará adiantado;
       Se SV for negativa, estará atrasado;",

   "SPI - Scheduled Performance Index" => "Índice de Performance do Cronograma/Prazos
    SPI: é a divisão entre o Valor Agregado (EV) e o valor planejado na linha de base (PV).
    Mostra a taxa de conversão do valor previsto em valor agregado. Se SPI for maior que 1,
    o projeto está sendo realizado a uma taxa de conversão maior do que a prevista, ou seja, adiantado; 
    Se SPI for menor que 1, o projeto está sendo realizado a uma taxa de conversão menor do que a prevista, 
    ou seja, atrasado;"
}
=end

# Exemplificando

#30% de um projeto realizado
#BAC: R$ 100.000,00
#PV: R$ 25.000,00                                                          
#AC: R$ 35.000,00
#EV: R$ 30.000,00
   
percentual = 30/100.0
bac = 100_000_000
ac  = 35_000
pv = 25_000 

formulas = [
  "ev = (bac*percentual)",
  "cv = ev - ac",
  "cpi = ev / ac",
  "spi = ev / pv",
  "sv = ev - pv",
  "eac = bac / cpi",
  "etc = bac - ev"
]

for formula in formulas 
  eval formula
  puts "#{formula}: #{formula.gsub(/\w+/){|r|eval(r).to_s}}"
end

#  ETC menos sensível = BAC – EV
#  ETC tradicional  = (BAC – EV) / CPI 
#  ETC mais sensível = (BAC – EV) / (CPI x SPI) 
#
#puts(cv > 0 || cpi > 1 ? "SOBRANDO R$" : "FALTANDO R$") 
#puts(sv < 0 || spi < 1 ? "ATRASADO" : "ADIANTADO")
#
# fontes
#   http://blog.youwilldobetter.com/2009/01/03/dicas-para-a-certificacao-pmp-%E2%80%93-formulas-tecnica-earned-value/
#   http://papogp.wordpress.com/2009/07/16/earned-value-project-management-com-eduardo-guimaraes-msc-pmp-pmi-sp/
#   http://fdlima-gp.blogspot.com/
