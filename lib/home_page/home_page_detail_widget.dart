part of counter.home_page;

class HomePageDetailWidget extends TStatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageDetailWidgetState();
}

class _HomePageDetailWidgetState extends State<StatefulWidget> {
  final MainBloc bloc = DI.get<MainBloc>(MainBloc);

  num get total => bloc.state.total;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      bloc: bloc,
      listener: _onStateChanged,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Total $total",
                style: TTextStyles.black(fontSize: 20, color: Colors.black),
              ),
              _buildButtonDecrease()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonDecrease() {
    return FlatButton(
      color: Color.fromARGB(255, 252, 108, 133),
      child: Text(
        "Decrease",
        style: TTextStyles.medium(fontSize: 16, color: Colors.white),
      ),
      onPressed: _onDecreasePressed,
    );
  }

  void _onStateChanged(BuildContext context, MainState state) {
    if (state is ValueChangedState) setState(() {});
  }

  void _onDecreasePressed() {
    bloc.add(OnDecreaseEvent(1));
  }
}
