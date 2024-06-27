class Message {
  String message;
  bool isUserOrBot;
bool isFailure;
bool isLoading;
  Message({required this.message, required this.isUserOrBot,this.isLoading = false,this.isFailure = false});
}
