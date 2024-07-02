class WorldNews {
  final String image;
  final String title;
  final String content;
  final String date;

  WorldNews({
    required this.image,
    required this.title,
    required this.content,
    required this.date,
  });
}

List<WorldNews> worldNews = [
  WorldNews(
    image:
        'https://image.cnbcfm.com/api/v1/image/107350350-1703123113518-gettyimages-1858399319-AFP_34884Y3.jpeg',
    title:
        'Bank of Japan is expected to trim bond buying by \$100 billion in first year, Reuters survey shows',
    content:
        'Japan bond market participants expect the central bank to trim bond purchases by roughly \$100 billion in the first year under a quantitative tightening (QT) plan set for release this month, according to a survey conducted by Reuters.\n\nA Reuters survey of 19 banks, brokerages, insurers and asset managers showed they expect the Bank of Japan to trim bond buying by an average 16.1 trillion yen (\$99.7 billion) in the first year.\n\nThat would translate into monthly purchases of 4.65 trillion yen, down from the current pace of around 6 trillion yen. In the second year, the respondents expect the purchase amount to fall to an average 3.55 trillion yen, the survey showed.\n\nCombined, it would amount to a reduction of roughly 45 trillion yen during the two-year period',
    date: '02.07.2024',
  ),
  WorldNews(
    image:
        'https://image.cnbcfm.com/api/v1/image/107432293-1719240576296-gettyimages-2153753009-AA_24052024_1694110.jpeg',
    title:
        'Collapsed bitcoin exchange Mt. Gox is about to unload \$9 billion of coins onto the market. Here\'s what it means',
    content:
        'A bitcoin exchange that collapsed 10 years ago after being hacked is set to return billions of dollars worth of the token to users — and it has investors worried.\n\nIn a few days, bankrupt Tokyo-based bitcoin exchange Mt. Gox will begin paying back thousands of users almost \$9 billion worth of tokens. The platform went under in 2014 following a series of heists that cost it in the range of 650,000 to 950,000 bitcoins, or upward of \$59 billion, at current prices.',
    date: '01.07.2024',
  ),
  WorldNews(
    image:
        'https://ichef.bbci.co.uk/news/1024/cpsprodpb/15ECD/production/_127150898_mediaitem127150897.jpg.webp',
    title:
        'Gas and electricity prices fell by 7% in England, Scotland and Wales on 1 July.',
    content:
        'Under the new energy price cap, the typical annual dual-fuel bill paid by direct debit is now £1,568 per year.\n\nHowever, while bills are at their lowest for two years, they remain about £400 higher than they were three years ago.',
    date: '01.07.2024',
  ),
];
