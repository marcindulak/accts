Print[ "ProcessorCount ", $ProcessorCount ]
Print[ "KernelCount ", $KernelCount ]
p = 20
ints = Table[x^n, {n, 0, p}]
Do[ Print[ Integrate[Part[ints, n], x]], {n, 0, p + 1}]
