class ResponseAPI {
   String status;
   Object data;
   String message;
  ResponseAPI({required this.status, required this.data,this.message = ''});

 
  @override
  String toString() {
    return 'ResponseAPI{status: $status, data: $data, message: $message}';
  }
}                                                                                                                       


