function number_or_default(?int $x): int {
  if ($x is null) {
    return 42;
  } else {
    return $x;
  }
}
interface TraverseFrom<Tv, Ti> {
  public function startAt(Ti $_): Traversable<Tv>;
}

class TraverseIntsFromStart implements TraverseFrom<int, null> {
  public function __construct(private vec<int> $items) {}

  public function startAt(null $_): Traversable<int> {
    return $this->items;
  }
}