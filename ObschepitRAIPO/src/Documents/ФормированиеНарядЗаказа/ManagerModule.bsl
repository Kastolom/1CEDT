#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныеПроцедурыИФункции
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = ПолучитьМакет("НарядЗаказ");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ФормированиеНарядЗаказа.Дата,
	|	ФормированиеНарядЗаказа.Номер,
	|	ФормированиеНарядЗаказа.Товары.(
	//|		НомерСтроки,
	|		Товар,
	|		Цена,
	|		Выход,
	|		Количество
	|	)
	|ИЗ
	|	Документ.ФормированиеНарядЗаказа КАК ФормированиеНарядЗаказа
	|ГДЕ
	|	ФормированиеНарядЗаказа.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьШапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьШапкаИтого = Макет.ПолучитьОбласть("ШапкаИтого");
	ОбластьТовары = Макет.ПолучитьОбласть("Товары");
	ОбластьСырье = Макет.ПолучитьОбласть("Сырье");
	

	ТабДок.Очистить();
	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;		

		ОбластьШапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(ОбластьШапка);
					
		ВыборкаТовары = Выборка.Товары.Выбрать();
		Пока ВыборкаТовары.Следующий() Цикл
			
			ПараметныОбработки = Новый Структура;
			ПараметныОбработки.Вставить("Наименование", ВыборкаТовары.Товар.Наименование);
			ПараметныОбработки.Вставить("Выход",ВыборкаТовары.Выход);
			ПараметныОбработки.Вставить("Количество",ВыборкаТовары.Количество);
			ПараметныОбработки.Вставить("Цена", ВыборкаТовары.Цена);
			ПараметныОбработки.Вставить("Сумма", ВыборкаТовары.Цена*ВыборкаТовары.Количество); 
			
			//ОбластьТовары.Параметры.Заполнить(ВыборкаТовары.Товар);
			ОбластьТовары.Параметры.Заполнить(ПараметныОбработки);    
			
			ТабДок.Вывести(ОбластьТовары);
			Для Каждого Продукт Из ВыборкаТовары.Товар.Продукты Цикл	
				ОбластьСырье.Параметры.Заполнить(Продукт);
				ТабДок.Вывести(ОбластьСырье);	
				//ОбластьТовары.Параметры.Заполнить(Продукт.Продукт);
				//ТабДок.Вывести(ОбластьТовары, ВыборкаТовары.Уровень());
			КонецЦикла;
		КонецЦикла;		
		ТабДок.Вывести(ОбластьШапкаИтого);	
		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
#КонецОбласти
#КонецЕсли