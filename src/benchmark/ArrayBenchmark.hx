package benchmark;

import tink.unit.Assert.*;
import tink.testrunner.*;

class ArrayBenchmark {
	var result:Int = 0;
	
	public function new() {}
	
	@:generic
	@:variant(0)
	@:variant(0.1)
	@:variant('0')
	@:variant(true)
	@:variant(this)
	public function push<T>(v:T):Assertions {
		var array = [];
		return benchmark(1000000, array.push(v));
	}
	
	@:generic
	@:variant(0)
	@:variant(0.1)
	@:variant('0')
	@:variant(true)
	@:variant(this)
	public function iterate<T>(v:T):Assertions {
		var array = [for(_ in 0...1000000) v];
		return benchmark(100, {
			result = 0;
			for(i in array) result++;
		});
	}
	
	@:generic
	@:variant(0)
	@:variant(0.1)
	@:variant('0')
	@:variant(true)
	@:variant(this)
	public function getFirst<T>(v:T):Assertions {
		var array = [for(_ in 0...1000000) v];
		var temp;
		return benchmark(1000000, temp = array[0]);
	}
	
	@:generic
	@:variant(0)
	@:variant(0.1)
	@:variant('0')
	@:variant(true)
	@:variant(this)
	public function getLast<T>(v:T):Assertions {
		var array = [for(_ in 0...1000000) v];
		var temp;
		return benchmark(1000000, temp = array[1000000 - 1]);
	}
	
	@:generic
	@:variant(0)
	@:variant(0.1)
	@:variant('0')
	@:variant(true)
	@:variant(this)
	public function copy<T>(v:T):Assertions {
		var array = [for(_ in 0...1000000) v];
		return benchmark(100, array.copy());
	}
	
	@:generic
	@:variant(0)
	@:variant(0.1)
	@:variant('0')
	@:variant(true)
	@:variant(this)
	public function spliceHead<T>(v:T):Assertions {
		var array = [for(_ in 0...100000) v];
		return benchmark(100000, array.splice(0, 1));
	}
	
	@:generic
	@:variant(0)
	@:variant(0.1)
	@:variant('0')
	@:variant(true)
	@:variant(this)
	public function spliceTail<T>(v:T):Assertions {
		var array = [for(_ in 0...100000) v];
		return benchmark(100000, array.splice(array.length - 1, 1));
	}
	
	@:generic
	@:variant(0, 1)
	@:variant(0.1, 0.2)
	@:variant('0', '1')
	@:variant(true, false)
	@:variant(this, new benchmark.ArrayBenchmark())
	public function indexOfHead<T>(v:T, i:T):Assertions {
		var array = [for(_ in 0...1000) v];
		array[0] = i;
		result = 0;
		return benchmark(1000, result += array.indexOf(i));
	}
	
	@:generic
	@:variant(0, 1)
	@:variant(0.1, 0.2)
	@:variant('0', '1')
	@:variant(true, false)
	@:variant(this, new benchmark.ArrayBenchmark())
	public function indexOfTail<T>(v:T, i:T):Assertions {
		var array = [for(_ in 0...1000) v];
		array[array.length - 1] = i;
		result = 0;
		return benchmark(1000, result += array.indexOf(i));
	}
}