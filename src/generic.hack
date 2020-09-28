class StackUnderflowException extends \Exception {}

class Stack<T> {
  private vec<T> $stack;
  private int $stackPtr;

  public function __construct() {
    $this->stackPtr = 0;
    $this->stack = vec[];
  }

  public function push(T $value): void {
    $this->stack[] = $value;
    $this->stackPtr++;
  }

  public function pop(): T {
    if ($this->stackPtr > 0) {
      $this->stackPtr--;
      return $this->stack[$this->stackPtr];
    } else {
      throw new StackUnderflowException();
    }
  }
}


function takes_nullable_str2(?string $s): string {
  if ($s is nonnull){
    return $s;
  } else {
    return "default";
  }
}

function takes_nullable_str(?string $s): string {
  if ($s is null){
    return "default";
  } else {
    return $s;
  }
}

function my_filter_nulls<T as nonnull>(vec<?T> $items): vec<T> {
  $result = vec[];
  foreach ($items as $item) {
    if ($item is null) {
      // Discard it.
    } else {
      $result[] = $item;
    }
  }
  return $result;
}
