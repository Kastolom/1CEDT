#Область ОбработчикиСобытийФормы
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ТабличнаяЧасть = Объект.Продукты;
	Для Каждого Элемент из ТабличнаяЧасть Цикл
		Элемент.Сумма = Элемент.Цена * Элемент.Норма;
	КонецЦикла;
	Элементы.Сумма.ТекстПодвала = Объект.Продукты.Итог("Сумма");
	Объект.ЦенаБлюда = Объект.Продукты.Итог("Сумма")/100; 
КонецПроцедуры
#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыПродукты
&НаКлиенте
Процедура ПродуктПриИзменении(Элемент)
	ПриИзменении();
КонецПроцедуры

&НаКлиенте
Процедура НормаПриИзменении(Элемент)
	ПриИзменении();
КонецПроцедуры

&НаКлиенте
Процедура ПродуктыПослеУдаления(Элемент)
	Элементы.Сумма.ТекстПодвала = Объект.Продукты.Итог("Сумма");
	Объект.ЦенаБлюда = Объект.Продукты.Итог("Сумма")/100;
КонецПроцедуры
#КонецОбласти

#Область СлужебныеПроцедурыИФункции
&НаКлиенте
Процедура ПриИзменении()
	СтрокаТабличнойЧасти = Элементы.Продукты.ТекущиеДанные;
	СтрокаТабличнойЧасти.Цена = ОбщиеПроцедурыВызовСервера.ПолучитьЗначениеРеквизитаНаСервере(СтрокаТабличнойЧасти.Продукт, "Цена");
	СтрокаТабличнойЧасти.Сумма = СтрокаТабличнойЧасти.Цена * СтрокаТабличнойЧасти.Норма; 
	Элементы.Сумма.ТекстПодвала = Объект.Продукты.Итог("Сумма");
	Объект.ЦенаБлюда = Объект.Продукты.Итог("Сумма")/100;
КонецПроцедуры
#КонецОбласти


