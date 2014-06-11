Print[ "ProcessorCount ", $ProcessorCount ]
Print[ "KernelCount ", $KernelCount ]
p = 20
ints = Table[x^n, {n, 0, p}]
ParallelTable[Integrate[int, x], {int, ints}]
