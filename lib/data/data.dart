import 'package:flutter/material.dart';

import '../utils/const.dart';

class Category {
  final String title;
  final IconData icon;
  final Color color;

  Category(this.title, this.icon, this.color);
}

class Article {
  final String title;
  final String content;
  final String? url;

  Article(this.title, this.content, this.url);
}

Map<Category, List<Article>> data = {
  Category(
    'Алгоритмы сжатия данных',
    Icons.compress_rounded,
    Constants.lightPink,
  ): [
    Article(
      'Принципы сжатия данных',
      'assets/files/compression/principi_szhatiya_dannyh.epub',
      null,
    ),
    Article(
      'Основные методы',
      'assets/files/compression/osnovniyi_metodi.epub',
      null,
    )
  ],
  Category(
    'Дискретное преобразование Фурье',
    Icons.auto_graph_rounded,
    Constants.lightYellow,
  ): [
    Article(
      'Прямое дискретное преобразование Фурье (ДПФ)',
      'assets/files/discrete/primoe.epub',
      null,
    ),
    Article(
      'Вычисление дискретного преобразования Фурье',
      'assets/files/discrete/vchislenie_f.epub',
      null,
    ),
    Article(
      'ДПФ в БПФ: использование симметрии',
      'assets/files/discrete/dpf_dpf_f.epub',
      null,
    ),
    Article(
      'Симметрии в дискретном преобразовании Фурье',
      'assets/files/discrete/simmetriya.epub',
      null,
    ),
    Article(
      'Обратное дискретное преобразование Фурье (ОДПФ)',
      'assets/files/discrete/obrat.epub',
      null,
    ),
  ],
  Category(
    'Пузырьковая сортировка и её улучшения',
    Icons.sort_rounded,
    Constants.lightViolet,
  ): [
    Article(
      'Сортировка пузырьком',
      'assets/files/sort/Сортировка-пузырьком.epub',
      'assets/files/sort/bubble_1.gif',
    ),
    Article(
      'Сортировка перемешиванием (шейкерная сортировка)',
      'assets/files/sort/Сортировка-перемешиванием.epub',
      'assets/files/sort/shaker_1.gif',
    ),
    Article(
      'Сортировка расчёской',
      'assets/files/sort/Сортировка-расчёской.epub',
      'assets/files/sort/расчёска.gif',
    ),
    Article(
      'Сортировка вставками',
      'assets/files/sort/Сортировка-вставками.epub',
      'assets/files/sort/сорт_вставками.gif',
    ),
    Article(
      'Сортировка выбором',
      'assets/files/sort/Сортировка-перемешиванием.epub',
      'assets/files/sort/сорт_выбором.gif',
    ),
    Article(
      'Быстрая сортировка',
      'assets/files/sort/Сортировка-перемешиванием.epub',
      'assets/files/sort/быстрая_сорт.gif',
    ),
    Article(
      'Пирамидальная сортировка',
      'assets/files/sort/Сортировка-перемешиванием.epub',
      'assets/files/sort/пирамид_сортировка.gif',
    ),
  ],
  Category('RSA-алгоритмы', Icons.lock_rounded, Constants.blueDark): [
    Article(
      'Генерация ключей — поиск простых чисел',
      'assets/files/rsa/generaciya.epub',
      null,
    ),
    Article(
      'Операции в кольце вычетов.epub',
      'assets/files/rsa/operaciya.epub',
      null,
    ),
    Article(
      'Поиск взаимно простого числа',
      'assets/files/rsa/poisk.epub',
      null,
    ),
    Article(
      'Шифрование и дешифрование',
      'assets/files/rsa/shifr.epub',
      null,
    ),
  ]
};
