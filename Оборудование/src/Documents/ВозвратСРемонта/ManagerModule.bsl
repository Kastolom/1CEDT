#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныеПроцедурыИФункции

Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ВозвратСРемонта.Дата,
	|	ВозвратСРемонта.Куда,
	|	ВозвратСРемонта.Номенклатура,
	|	ВозвратСРемонта.Номер,
	|	ВозвратСРемонта.ПереченьРемонта.(
	|		НомерСтроки,
	|		ВидРемонта,
	|		Цена
	|	)
	|ИЗ
	|	Документ.ВозвратСРемонта КАК ВозвратСРемонта
	|ГДЕ
	|	ВозвратСРемонта.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьПереченьРемонтаШапка = Макет.ПолучитьОбласть("ПереченьРемонтаШапка");
	ОбластьПереченьРемонта = Макет.ПолучитьОбласть("ПереченьРемонта");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьПереченьРемонтаШапка);
		ВыборкаПереченьРемонта = Выборка.ПереченьРемонта.Выбрать();
		Пока ВыборкаПереченьРемонта.Следующий() Цикл
			ОбластьПереченьРемонта.Параметры.Заполнить(ВыборкаПереченьРемонта);
			ТабДок.Вывести(ОбластьПереченьРемонта, ВыборкаПереченьРемонта.Уровень());
		КонецЦикла;

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры

#КонецОбласти
#КонецЕсли


