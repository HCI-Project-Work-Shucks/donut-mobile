class TestUser {
  int uid, phone, completedDeals, pendingDeals;
  String name, emails, password, about, profilePic;

  TestUser({
    this.uid = 00000000,
    this.name = '',
    this.phone = 00000000,
    this.emails = '',
    this.password = '',
    this.completedDeals = 0,
    this.pendingDeals = 0,
    this.about = '',
    this.profilePic = '',
  });
}

List test_users = [
  TestUser(
    uid: 00000001,
    name: 'Donut_1',
    profilePic: 'assets/images/profile_pic.jpeg',
    about: 'I am a 2 donut',
    pendingDeals: 3,
    completedDeals: 0,
    phone: 81029102,
    emails: 'a',
    password: '1',
  ),
  TestUser(
    uid: 00000002,
    name: 'Donut_2',
    about: 'I am a donut',
    pendingDeals: 3,
    completedDeals: 0,
    phone: 81029102,
    emails: 'b',
    password: '2',
  ),
  TestUser(
    uid: 00000003,
    name: 'Donut_3',
    about: 'I am a donut',
    pendingDeals: 3,
    completedDeals: 0,
    emails: 'c',
    password: '3',
  ),
];
