import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/domain/models/message.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';

class ChatBotViewModel {
  ChatBotViewModel(this._repository);

  final Repository _repository;

  List<Message> messages = [];

  final StreamController _messageListStreamController =
      BehaviorSubject<List<Message>?>();

  Stream<List<Message>?> get outputMessageList =>
      _messageListStreamController.stream.map((messageList) => messageList);

  Sink get inputMessageList => _messageListStreamController.sink;

  sendMessage(dynamic context, String message) async {
    if (message.isNotEmpty) {
      setMessage(Message(message: message, isUserOrBot: true));
      setMessage(
          Message(message: message, isUserOrBot: false, isLoading: true));

      (await _repository.chatBot(message)).fold(
          (failure) => {
                removeLastMessage(),
                setMessage(Message(
                    message: message, isUserOrBot: false, isFailure: true))
              }, (data) {
        removeLastMessage();
        setMessage(data);
      });
    }
  }

  setMessage(Message message) {
    messages.add(message);
    inputMessageList.add(messages);
  }

  removeMessage(Message message) {
    messages.remove(message);
    inputMessageList.add(messages);
  }

  removeLastMessage() {
    messages.removeLast();
    inputMessageList.add(messages);
  }
}
