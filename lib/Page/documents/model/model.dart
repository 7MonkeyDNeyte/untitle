class User {
  final String name;
  final String email;
  final String image;

  User({
    required this.name,
    required this.email,
    required this.image,
  });
}

final allUsers = [
  User(
    name: "Robert Myers",
    email: 'robMYers@gmail.com',
    image: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
  ),
  User(
    name: "Wynter Myers",
    email: 'WYnterr@gmail.com',
    image: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
  User(
    name: "devid hali",
    email: 'disosz@gmail.com',
    image: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
  ),
];
