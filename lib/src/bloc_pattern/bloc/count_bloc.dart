import 'dart:async';

class CountBloc {
  CountEventBloc countEventBloc = CountEventBloc();
  int _count = 0;
  String _name = 'test';

  final StreamController<int> _countSubject = StreamController<int>();
  final StreamController<String> _textSubject = StreamController<String>();

  Stream<int> get count => _countSubject.stream;
  Stream<String> get string => _textSubject.stream;

  CountBloc() {
    countEventBloc._countEventSubject.stream.listen(_countEventListen);
    countEventBloc._textEventSubject.stream.listen(_textEventListen);
  }

  _countEventListen(CountEvent event) {
    switch (event) {
      case CountEvent.ADD_EVENT:
        _count++;
        break;
      case CountEvent.SUBTRACT_EVENT:
        _count--;
        break;
    }
    _countSubject.sink.add(_count);
  }

  _textEventListen(TextEvent event) {
    switch (event) {
      case TextEvent.DELETE:
        _name = '';
        break;
      case TextEvent.TEST:
        _name = 'test';
        break;
    }
    _textSubject.sink.add(_name);
  }

  dispose() {
    _countSubject.close();
    countEventBloc.dispose();
  }
}

class CountEventBloc {
  final StreamController<CountEvent> _countEventSubject =
      StreamController<CountEvent>();
  final StreamController<TextEvent> _textEventSubject =
      StreamController<TextEvent>();
  Sink<CountEvent> get countEventSink => _countEventSubject.sink;
  Sink<TextEvent> get textEventSink => _textEventSubject.sink;

  dispose() {
    _countEventSubject.close();
    _textEventSubject.close();
  }
}

enum CountEvent { ADD_EVENT, SUBTRACT_EVENT }
enum TextEvent { DELETE, TEST }
