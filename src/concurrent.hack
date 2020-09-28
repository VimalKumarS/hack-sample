
<<__EntryPoint>>
async function main(): Awaitable<void>  {
  //$x = 0;
  try {
    concurrent {
      //$x = await async { return 1; };
      await async { throw new Exception('foo'); }
      await async { throw new Exception('bar'); }
    }
  } catch (Exception $e) {
    var_dump($x, $e->getMessage());
  }
}