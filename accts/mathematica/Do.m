Print[ "ProcessorCount ", $ProcessorCount ]
Print[ "KernelCount ", $KernelCount ]
p = 20
ints = Table[x^n, {n, 1, p}]
Do[ Print[ Integrate[Part[ints, n], x]], {n, 1, p}]
