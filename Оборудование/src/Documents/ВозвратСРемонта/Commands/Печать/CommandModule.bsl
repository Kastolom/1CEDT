


#Область ОбработчикиСобытий
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	ТабДок = Новый ТабличныйДокумент;
	Печать(ТабДок, ПараметрКоманды);

	ТабДок.ОтображатьСетку = Ложь;
	ТабДок.Защита = Ложь;
	ТабДок.ТолькоПросмотр = Ложь;
	ТабДок.ОтображатьЗаголовки = Ложь;
	ТабДок.Показать();
	//}}
КонецПроцедуры
#КонецОбласти

#Область СлужебныеПроцедурыИФункции
&НаСервере
Процедура Печать(ТабДок, ПараметрКоманды)
	Документы.ВозвратСРемонта.Печать(ТабДок, ПараметрКоманды);
КонецПроцедуры
#КонецОбласти
