
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда
	
#Область ОбработчикиСобытий

Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр Расходы Приход
	Движения.Расходы.Записывать = Истина;
	Для Каждого ТекСтрокаПереченьРемонта Из ПереченьРемонта Цикл
		Движение = Движения.Расходы.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаПереченьРемонта.ВидРемонта;
		Движение.Цена = ТекСтрокаПереченьРемонта.Цена;
	КонецЦикла;

	// регистр Остатки Приход
	Движения.Остатки.Записывать = Истина;
	Движение = Движения.Остатки.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Номенклатура = Номенклатура;
	Движение.Субъект = Куда;
	Движение.Количество = 1;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

#КонецОбласти

#Иначе
  ВызватьИсключение НСтр("ru = 'Недопустимый вызов объекта на клиенте.'");
#КонецЕсли

