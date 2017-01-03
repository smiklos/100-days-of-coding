defmodule Buycar do


  def nb_months(startPriceOld, startPriceNew, savingperMonth, percentLossByMonth) do


  _months(0,startPriceOld, startPriceNew, savingperMonth, percentLossByMonth)

  end

   defp _months(month,startPriceOld, startPriceNew, savingperMonth, percentLossByMonth) do
  currentMoney = startPriceOld + month * savingperMonth
  case currentMoney do
    _ when currentMoney >= startPriceNew ->   {month,round(currentMoney - startPriceNew)}
    _ ->
   percentLoss = calcLoss month + 1, percentLossByMonth
   loss = 0.01 * percentLoss
   _months(month + 1, startPriceOld - (startPriceOld * loss),startPriceNew - (startPriceNew * loss ),savingperMonth,percentLoss)
 end
  end

  defp calcLoss(month, loss) do
    if  rem(month, 2) == 0 do loss + 0.5
    else loss
  end
end
end

result = Buycar.nb_months(8000, 12000, 500, 1)
IO.puts (case result do
  {month, remaining} -> IO.puts "#{month} and #{remaining} remaining"
end)
