function watson-add-game
  set year_month (date -u +"%Y-%m")
  set start_time "$year_month-$argv[2] $argv[3]"
  set end_time "$year_month-$argv[4] $argv[5]"

  if test (count $argv) -eq 5
    watson add -f $start_time -t $end_time fun +$argv[1]
  else
    watson add -f $start_time -t $end_time fun +$argv[1] +$argv[6]
  end
end
