part of counter.home_page;

class HomePageScreen extends TStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: HomePageDetailWidget(),
      floatingActionButton: _buildActionButton(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Counter",
        style: TTextStyles.bold(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _buildActionButton() {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 252, 108, 133),
      child: Icon(
        Icons.add,
        size: 24,
      ),
      onPressed: _onPressActionButton,
    );
  }

  void _onPressActionButton() {
    final MainBloc bloc = DI.get<MainBloc>(MainBloc);
    final OnIncreaseEvent addEvent = OnIncreaseEvent(1);
    bloc.add(addEvent);
  }
}
