function watson-add-fortnite
  if test (count $argv) -eq 4
    watson add -f "2020-04-$argv[1] $argv[2]" -t "2020-04-$argv[3] $argv[4]" fun +fortnite
  else
    watson add -f "2020-04-$argv[1] $argv[2]" -t "2020-04-$argv[3] $argv[4]" fun +fortnite +$argv[5]
  end
end
