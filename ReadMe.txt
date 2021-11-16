Created By Jaymin Patel

Overview:
This codebase sample is for API call. Which includes GET and POST method demo.


Dependency: Add into pubspec.yaml file
http: ^0.12.2 // For API call
fluttertoast: ^7.1.6 // For Toast

Details:
1. Networking package includes all the classes related to API call.

2. Response.dart:
This is the generic class for API Response Data

3. ReturnType.dart:
This is enum for the Return types (i.e GET_USERS,POST_ADD_POST..)

4.URLS.dart:
This is constant file for the API urls and base url.

5.APIProvider.dart:
This is the manager class for API calls. Which includes the API methods such as GET and POST. Use this class for API calls in your apps.

6.UserList.dart:
This is for the list of users and on tap of any user it will display a Toast using showToast() function.


