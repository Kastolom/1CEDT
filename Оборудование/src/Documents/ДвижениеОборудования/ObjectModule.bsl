
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда
	
#Область ОбработчикиСобытий

Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр Остатки Расход
	Движения.Остатки.Записывать = Истина;
	Для Каждого ТекСтрокаОборудование Из Оборудование Цикл
		Движение = Движения.Остатки.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаОборудование.Номенклатура;
		Движение.Субъект = Откуда;
		Движение.Количество = Число(ТекСтрокаОборудование.Количество);
	КонецЦикла;

	// регистр Остатки Приход
	Движения.Остатки.Записывать = Истина;
	Для Каждого ТекСтрокаОборудование Из Оборудование Цикл
		Движение = Движения.Остатки.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаОборудование.Номенклатура;
		Движение.Субъект = Куда;
		Движение.Количество = Число(ТекСтрокаОборудование.Количество);
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

#КонецОбласти

#Иначе
  ВызватьИсключение НСтр("ru = 'Недопустимый вызов объекта на клиенте.'");
#КонецЕсли

