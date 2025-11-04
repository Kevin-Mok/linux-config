function timetrace-list
    timetrace list records today | head -n 6
    timetrace list records today | awk 'NR>6 && /^\+/{exit} NR>6' | sort -t '|' -k3,3
    timetrace list records today | tail -n 3
end