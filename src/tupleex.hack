<<__EntryPoint>>
function main(): void {
  $tuple = tuple('string', 1, false);
  list($string, $int, $bool) = $tuple;
  takes_string($string);
  takes_int($int);
  takes_bool($bool);
  echo 'The typechecker understands the types of list().';

  $tuple = tuple('a', 'b', 'c', 1, 2, 3);
  list($_, $b, $c, $_, $two, $_) = $tuple;
  echo "b -> {$b}, c -> {$c}, two -> {$two}\n";

  $vec_of_tuples = vec[
  tuple('A', 'B', 'C'),
  tuple('a', 'b', 'c'),
  tuple('X', 'Y', 'Z'),
];

foreach ($vec_of_tuples as list($first, $second, $third)) {
  echo "{$first} {$second} {$third}\n";
}
}

function takes_string(string $_): void {}
function takes_int(int $_): void {}
function takes_bool(bool $_): void {}
