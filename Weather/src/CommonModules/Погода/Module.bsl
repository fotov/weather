Функция ПогодаВМосквеСейчас() Экспорт
	
	ТемператураВКельвинах = -273.15;
	
	АдресСерверра = "api.openweathermap.org";
	СтрокаЗапросаПогоды = "data/2.5/weather?q=moscow,ru&APPID=26b95bbbd9d9a1cbcee1603b6ee4eb4f";
	
	Соединение = Новый HTTPСоединение(АдресСерверра);
	Запрос = Новый HTTPЗапрос(СтрокаЗапросаПогоды);
	
	Ответ = Соединение.ВызватьHTTPМетод("GET", Запрос);
	
	Если Ответ.КодСостояния = 200 Тогда
	
		Результат = Ответ.ПолучитьТелоКакСтроку();

		Чтение = Новый ЧтениеJSON;
		Чтение.УстановитьСтроку(Результат);
		РезультатПреобразования = ПрочитатьJSON(Чтение);
		
		ПогодаВМосквеСейчас = ТемператураВКельвинах + РезультатПреобразования.main.temp;
		
	Иначе
		
		ПогодаВМосквеСейчас = Неопределено;
		
	КонецЕсли;
	
	Возврат ПогодаВМосквеСейчас;

КонецФункции