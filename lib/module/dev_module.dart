part of counter.module;

class DevModule extends AbstractModule {
  @override
  void init() {
    bind(MainBloc).to(MainBloc());
  }
}
