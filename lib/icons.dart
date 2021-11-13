class MeditationSvgAssets {
  static final MeditationSvgAssets _instance = MeditationSvgAssets._internal();

  factory MeditationSvgAssets() {
    return _instance;
  }

  MeditationSvgAssets._internal();

  Map<AssetName, String> assets = {
    AssetName.search: "assets/icons/search.svg",
    AssetName.vectorBottom: "assets/pics/Vector.svg",
    AssetName.vectorTop: "assets/pics/Vector-1.svg",
    AssetName.headphone: "assets/icons/headphone.svg",
    AssetName.freshers: "assets/icons/freshers.svg",
    AssetName.vectorSmallBottom: "assets/pics/VectorSmallBottom.svg",
    AssetName.vectorSmallTop: "assets/pics/VectorSmallTop.svg",
    AssetName.instagram: "assets/icons/instagram.svg",
    AssetName.back: "assets/icons/back.svg",
    AssetName.telegram: "assets/icons/telegram.svg",
    AssetName.chart: "assets/icons/chart.svg",
    AssetName.discover: "assets/icons/discover.svg",
    AssetName.profile: "assets/icons/profile.svg",
    AssetName.event: "assets/icons/event.svg",
    AssetName.dtu: "assets/icons/dtu.svg",
    AssetName.job: "assets/icons/job.svg",
    AssetName.news: "assets/icons/news.svg",
    AssetName.tender: "assets/icons/tender.svg",
    AssetName.notice: "assets/icons/notice.svg",
    AssetName.github: "assets/icons/github.svg",
  };
}

enum AssetName {
  search,
  notice,
  news,
  job,
  event,
  tender,
  vectorBottom,
  vectorTop,
  headphone,
  instagram,
  freshers,
  telegram,
  vectorSmallBottom,
  vectorSmallTop,
  dtu,
  github,
  back,
  chart,
  discover,
  profile
}
