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


// function useIntStack(
//   \Hack\UserDocumentation\Generics\Introduction\Examples\Stack\Stack<int>
//     $stInt,
// ): void {
//   require_once("Stack.inc.php");
//   $stInt->push(10);
//   $stInt->push(20);
//   $stInt->push(30);
//   echo 'pop => '.$stInt->pop()."\n";
//   //  $stInt->push(10.5); // rejected as not being type-safe
// }


function swap<T>(inout T $i1, inout T $i2): void {
  $temp = $i1;
  $i1 = $i2;
  $i2 = $temp;
}

<<__EntryPoint>>
function main(): void {
  $v1 = -10;
  $v2 = 123;
  echo "\$v1 = ".$v1.", \$v2 = ".$v2."\n";
  swap(inout $v1, inout $v2);
  echo "\$v1 = ".$v1.", \$v2 = ".$v2."\n";

  $v3 = "red";
  $v4 = "purple";
  echo "\$v3 = ".$v3.", \$v4 = ".$v4."\n";
  swap(inout $v3, inout $v4);
  echo "\$v3 = ".$v3.", \$v4 = ".$v4."\n";
}