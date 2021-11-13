class DtuAPI {
  DtuAPI({
    required this.title,
    required this.importantUpdates,
    required this.note,
    required this.news,
    required this.events,
    required this.notices,
    required this.firstYearNotices,
    required this.registrationSchedule,
    required this.tenders,
    required this.jobs,
  });

  final String title;
  final List<ContentList> importantUpdates;
  final List<ContentList> news;
  final SubListElement note;
  final List<ContentList> events;
  final List<ContentList> notices;
  final List<ContentList> firstYearNotices;
  final List<ContentList> registrationSchedule;
  final List<ContentList> tenders;
  final List<ContentList> jobs;

  factory DtuAPI.fromJson(Map<String, dynamic> data) {
    final title = data['title'] as String;
    final newData = data['note'];
    final note = SubListElement.fromJson((newData));
    final importantUpdates = (data['important_updates'] as List<dynamic>)
        .map((x) => ContentList.fromJson(x))
        .toList();
    final news = (data['news'] as List<dynamic>)
        .map((x) => ContentList.fromJson(x))
        .toList();
    final events = (data['events'] as List<dynamic>)
        .map((x) => ContentList.fromJson(x))
        .toList();
    final notices = (data['notices'] as List<dynamic>)
        .map((x) => ContentList.fromJson(x))
        .toList();
    final firstYearNotices = (data['first_year_notices'] as List<dynamic>)
        .map((x) => ContentList.fromJson(x))
        .toList();
    final registrationSchedule =
        (data['registeration_schedule'] as List<dynamic>)
            .map((x) => ContentList.fromJson(x))
            .toList();
    final tenders = (data['tenders'] as List<dynamic>)
        .map((x) => ContentList.fromJson(x))
        .toList();
    final jobs = (data['jobs'] as List<dynamic>)
        .map((x) => ContentList.fromJson(x))
        .toList();
    return DtuAPI(
        title: title,
        importantUpdates: importantUpdates,
        note: note,
        news: news,
        events: events,
        notices: notices,
        registrationSchedule: registrationSchedule,
        jobs: jobs,
        tenders: tenders,
        firstYearNotices: firstYearNotices);
  }
}

class ContentList {
  ContentList({
    required this.name,
    this.subList,
    this.link,
  });

  final String name;
  final List<SubListElement>? subList;
  final String? link;
  factory ContentList.fromJson(Map<String, dynamic> data) {
    final name = data['name'] as String;
    final sub = data['sub_list'] as List<dynamic>?;
    if (sub != null) {
      final subList = (sub).map((x) => SubListElement.fromJson(x)).toList();
      return ContentList(name: name, subList: subList);
    } else {
      final link = data['link'] as String?;
      return ContentList(name: name.replaceAll('Date:', '\n\nDate : '), link: link);
    }
  }
}

class SubListElement {
  SubListElement({
    required this.name,
    required this.link,
  });

  final String name;
  final String link;

  factory SubListElement.fromJson(Map<String, dynamic> data) {
    final name = data['name'] as String;
    final link = data['link'] as String;
    return SubListElement(name: name.replaceAll('Date:', '\n\nDate : '), link: link);
  }
}
