# Troubleshooting

## Зачем

- утечки памяти OutOfMemory OOM
	- собственно касательно утечки есть 2 основных кейса 
		- объекты копятся и не попадают в мусор вообще, это можно воспроизвести тестированием на длительный период. 
		- И создается слишком много объектов на больших данных при вызове 1 метода АПИ, которые в итоге попадут в мусор, но их настолько много, что даже 1 вызов метода вызывает переполнение памяти
	- Так будет видно, что GC не собирает мусор вовремя, или вызывается слишком часто из-за нехватки памяти и создает нагрузку, или происходит собственно утечка 
		- какие-то объекты копятся и вообще не попадают в мусор, в результате на длительном периоде или при вызове на больших данных наступает переполнение памяти

## Технологии

- Web
  - Chrome Netexport записать как эталон
  - С кешем из firebug
- App
  - [PerfView](troubleshooting/perfview.md)
  - [dotmemory](https://www.jetbrains.com/dotmemory/)
- Mobile
  - [Android](troubleshooting/android.md)