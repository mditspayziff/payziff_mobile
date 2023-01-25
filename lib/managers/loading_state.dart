enum Loader {
  idle, waiting
}


abstract class LoaderState {
  Loader state = Loader.idle;
}