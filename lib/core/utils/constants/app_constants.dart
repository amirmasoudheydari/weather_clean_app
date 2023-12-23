// timeout request constants
const String commonErrorUnexpectedMessage =
    "something went wrong please try again";
const int timeoutRequestStatusCode = 1000;

/// app flavors strings
const String devEnvironmentString = 'DEV';
const String qaEnvironmentString = 'QA';
const String sitEnvironmentString = 'SIT';
const String uatEnvironmentString = 'UAT';
const String prodEnvironmentString = 'PROD';

/// IOException request constants
const String commonConnectionFailedMessage =
    'please check your Internet Connection';
const int ioExceptionStatusCode = 900;

// http client holder constants
const String acceptLanguageKey = 'Accept-Language';
const String authorisationKey = 'Authorisation';
const String bearerKey = 'Bearer';
const String contentTypeKey = 'Content-Type';
const String contentTypeValue = 'application/json';
const String contentMultiPartTypeValue = 'multipart/from-data';

// This is the time for every api call
const Duration timeDuration = Duration(seconds: 20);

// The app base Url should be provide in this value
const String devBaseUrl = 'https://api.openweathermap.org/data/2.5';
const String prodBaseUrl = 'https://api.openweathermap.org/data/2.5/prod';
const String qaBaseUrl = 'https://api.openweathermap.org/data/2.5/qa';
const String uatBaseUrl = 'https://api.openweathermap.org/data/2.5/uat';

// getWeather details uri's and header keys
const String getWeatherDetails = '/weather';
const String appIdKey = 'appid';
const String appIdValue = '0ae6735afdc6f99d7af23db5d1bd1fbe';
const String cityNameValue = 'q';
const String latitudeKey = 'lat';
const String longitudeKey = 'lon';

// local database keys
const String weatherInfoTable = 'weatherInfo';
