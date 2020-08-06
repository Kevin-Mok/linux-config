function watson-add-fortnite
  set year_month "2020-08"
  set start_time "$year_month-$argv[1] $argv[2]"
  set end_time "$year_month-$argv[3] $argv[4]"

  if test (count $argv) -eq 4
    watson add -f $start_time -t $end_time fun +fortnite
  else
    watson add -f $start_time -t $end_time fun +fortnite +$argv[5]
  end
end
