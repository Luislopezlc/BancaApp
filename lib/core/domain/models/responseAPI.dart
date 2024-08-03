class ResponseAPI {
   String status;
   Object data;

  ResponseAPI({required this.status, required this.data});

 
  @override
  String toString() {
    return 'ResponseAPI{status: $status, data: $data}';
  }
}                                                                                                                       


