enum DashBird {
  power(path: 'assets/images/dash_bird_power.png'),
  pencil(path: 'assets/images/dash_bird_pencil.png'),
  coffee(path: 'assets/images/dash_bird_coffee.png'),
  glasses(path: 'assets/images/dash_bird_glasses.png'),
  nightcap(path: 'assets/images/dash_bird_nightcap.png'),
  pc(path: 'assets/images/dash_bird_pc.png'),
  rockstar(path: 'assets/images/dash_bird_rockstar.png'),
  superdash(path: 'assets/images/dash_bird_superdash.png'),
  bunny(path: 'assets/images/dash_bird_bunny.png');

  const DashBird({required this.path});

  final String path;
}
