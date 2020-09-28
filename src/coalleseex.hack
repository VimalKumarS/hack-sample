//Use HH\Lib;
use namespace HH\Lib\{Vec,Dict,Keyset,Str,Math};
function get_counts_by_value(Traversable<string> $values): dict<string, int> {
  $counts_by_value = dict[];
  foreach ($values as $value) {
    $counts_by_value[$value] ??= 0;
    ++$counts_by_value[$value];
  }
  return $counts_by_value;
}

function get_people_by_age(
  KeyedTraversable<string, int> $ages_by_name,
): dict<int, vec<string>> {
  $people_by_age = dict[];
  foreach ($ages_by_name as $name => $age) {
    $people_by_age[$age] ??= vec[];
    $people_by_age[$age][] = $name;
  }
  return $people_by_age;
}



<<__EntryPoint>>
function main(): void {
  //require_once("HH\Lib");

  //require_once(__DIR__.'/../vendor/autoload.hack');
  //\Facebook\AutoloadMap\initialize();
  //use type HH\{Dict, Str};
  //require_once("HH.hack");
  $values = vec['foo', 'bar', 'foo', 'baz', 'bar', 'foo'];
  \print_r(get_counts_by_value($values));

  $people = dict[
    'Arthur' => 35,
    'Ford' => 110,
    'Trillian' => 35,
    'Zaphod' => 120,
  ];
  \print_r(
    get_people_by_age($people)
    |> Dict\map($$, $names ==> Str\join($names, ', '))
  );

  $x = vec[2,1,3]
  |> Vec\map($$, $a ==> $a * $a)
  |> Vec\sort($$);
}