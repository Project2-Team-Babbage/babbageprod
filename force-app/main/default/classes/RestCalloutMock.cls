@istest
global class RestCalloutMock  implements HttpCalloutMock{
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setStatusCode(201);
        return response; 
    }
}