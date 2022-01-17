class Reel {
  final String videoUrl;
  final String audioTitle;
  final String caption;
  final String totalLikes;
  final String totalComments;
  final bool isLiked;
  final bool isTagged;

  Reel(
    this.videoUrl,
    this.audioTitle,
    this.caption,
    this.totalLikes,
    this.totalComments,
    this.isLiked,
    this.isTagged,
  );
}
