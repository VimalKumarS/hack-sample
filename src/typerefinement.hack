use HH\Lib\{Vec,Dict,Keyset,Str,Math};
function f3(?int $p): void {
  if (!$p is null) { // type refinement occurs; $p has type int
    $x = $p % 3; // accepted; % defined for int
  }

  if ($p is nonnull) { // type refinement occurs; $p has type int
    $x = $p % 3; // accepted; % defined for int
  }
}


function f4(?num $p): void {
  if (($p is int) || ($p is float)) {
    $x = $p ** 2; // rejected
  }
}

class Point {
  private float $x;
  private float $y;
  public function __construct(num $x = 0, num $y = 0) {
    $this->x = (float)$x;
    $this->y = (float)$y;
  }
  public function __toString(): string {
    return '('.$this->x.','.$this->y.')';
  }
  // ...
}


<<__EntryPoint>>
function run(): void {
  require_once(__DIR__.'/../vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();
  f3(2);
  f4(2);
  $y = is_finite(2.0);
  $y = 5 is num;

  $colors = vec[]; // create an empty vec
  \var_dump($colors);

  $colors[] = "red"; // add element 0 with value "red"
  $colors[] = "white"; // add element 1 with value "white"
  $colors[] = "blue"; // add element 2 with value "blue"
  \var_dump($colors);

  $colors[0] = "pink"; // change element 0's value to "pink"
  \var_dump($colors);

  $colors = vec["green", "yellow"]; // create a vec of two elements
  \var_dump($colors);

  $colors = dict[]; // create an empty dict
  \var_dump($colors);

  $colors[4] = "black"; // create element 4 with value "black"
  \var_dump($colors);

  $colors[4] = "red"; // replace element 4's value with "red"
  $colors[8] = "white"; // create element 8 with value "white"
  $colors[-3] = "blue"; // create element -3 with value "blue"
  \var_dump($colors);

  $colors = dict[
    -10 => "white",
    12 => "blue",
    0 => "red",
  ]; // create a dict with 3 elements
  \var_dump($colors);
  $v = vec[1, 2, 3];
  $v = \HH\Lib\Vec\keys($v);
  $b= \HH\is_any_array($v);

}
