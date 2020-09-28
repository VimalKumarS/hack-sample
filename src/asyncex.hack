use HH\Lib\{Vec,Dict,Keyset,Str,Math};
// async function f(): Awaitable<int> {
//   return 2;
// }

// // We call f() and get back an Awaitable<int>
// // Once the function is finished executing and we await the awaitable (or in
// // this case, explicitly join since this call is not in an async function) to get
// // the explicit result of the function call, we will get back 2.

// <<__EntryPoint>>
// function join_main(): void {
//   \var_dump(\HH\Asio\join(f()));
// }

// async function foo(): Awaitable<int> {
//   return 3;
// }

// <<__EntryPoint>>
// async function single_awaitable_main(): Awaitable<void> {
//   $aw = foo(); // awaitable of type Awaitable<int>
//   $result = await $aw; // an int after $aw completes
//   \var_dump($result);
// }

// async function quads(float $n): Awaitable<float> {
//   return $n * 4.0;
// }

// <<__EntryPoint>>
// async function quads_m(): Awaitable<void> {
//     require_once(__DIR__.'/../vendor/autoload.hack');
//   \Facebook\AutoloadMap\initialize();
//   $awaitables = dict['five' => quads(5.0), 'nine' => quads(9.0)];
//   $results = await Dict\from_async($awaitables);

//   \var_dump($results['five']); // float(20)
//   \var_dump($results['nine']); // float(36)
// }

async function exception_thrower(): Awaitable<void> {
  throw new \Exception();
}

async function non_exception_thrower(): Awaitable<int> {
  return 2;
}

async function wrapping_exceptions(): Awaitable<void> {
  $handles = vec[
    \HH\Asio\wrap(exception_thrower()),
    \HH\Asio\wrap(non_exception_thrower()),
  ];
  // Since we wrapped, the results will contain both the exception and the
  // integer result
  $results = await Vec\from_async($handles);
  \var_dump($results);
}

<<__EntryPoint>>
function main(): void {
      require_once(__DIR__.'/../vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();
  \HH\Asio\join(wrapping_exceptions());
}