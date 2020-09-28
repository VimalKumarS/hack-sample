
namespace NS1 {
  const int CON1 = 100;
  function f(): void {
    echo "In ".__FUNCTION__."\n";
  }

  class C {
    const int C_CON = 200;
    public function f(): void {
      echo "In ".__NAMESPACE__."...".__METHOD__."\n";
    }
  }

  interface I {
    const int I_CON = 300;
  }

  trait T {
    public function f(): void {
      echo "In ".__TRAIT__."...".__NAMESPACE__."...".__METHOD__."\n";
    }
  }
}

namespace NS2 {
  use type NS1\{C, I, T};

  class D extends C implements I {
    use T;
  }

  function f(): void {
    $d = new D();
    echo "CON1 = ".\NS1\CON1."\n";
    \NS1\f();
  }
}