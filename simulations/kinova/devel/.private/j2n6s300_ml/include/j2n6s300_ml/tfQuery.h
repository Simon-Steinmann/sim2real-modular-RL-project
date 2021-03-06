// Generated by gencpp from file j2n6s300_ml/tfQuery.msg
// DO NOT EDIT!


#ifndef J2N6S300_ML_MESSAGE_TFQUERY_H
#define J2N6S300_ML_MESSAGE_TFQUERY_H

#include <ros/service_traits.h>


#include <j2n6s300_ml/tfQueryRequest.h>
#include <j2n6s300_ml/tfQueryResponse.h>


namespace j2n6s300_ml
{

struct tfQuery
{

typedef tfQueryRequest Request;
typedef tfQueryResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct tfQuery
} // namespace j2n6s300_ml


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::j2n6s300_ml::tfQuery > {
  static const char* value()
  {
    return "00bf7357a79d1c228b9ae3c8a88c8af2";
  }

  static const char* value(const ::j2n6s300_ml::tfQuery&) { return value(); }
};

template<>
struct DataType< ::j2n6s300_ml::tfQuery > {
  static const char* value()
  {
    return "j2n6s300_ml/tfQuery";
  }

  static const char* value(const ::j2n6s300_ml::tfQuery&) { return value(); }
};


// service_traits::MD5Sum< ::j2n6s300_ml::tfQueryRequest> should match 
// service_traits::MD5Sum< ::j2n6s300_ml::tfQuery > 
template<>
struct MD5Sum< ::j2n6s300_ml::tfQueryRequest>
{
  static const char* value()
  {
    return MD5Sum< ::j2n6s300_ml::tfQuery >::value();
  }
  static const char* value(const ::j2n6s300_ml::tfQueryRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::j2n6s300_ml::tfQueryRequest> should match 
// service_traits::DataType< ::j2n6s300_ml::tfQuery > 
template<>
struct DataType< ::j2n6s300_ml::tfQueryRequest>
{
  static const char* value()
  {
    return DataType< ::j2n6s300_ml::tfQuery >::value();
  }
  static const char* value(const ::j2n6s300_ml::tfQueryRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::j2n6s300_ml::tfQueryResponse> should match 
// service_traits::MD5Sum< ::j2n6s300_ml::tfQuery > 
template<>
struct MD5Sum< ::j2n6s300_ml::tfQueryResponse>
{
  static const char* value()
  {
    return MD5Sum< ::j2n6s300_ml::tfQuery >::value();
  }
  static const char* value(const ::j2n6s300_ml::tfQueryResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::j2n6s300_ml::tfQueryResponse> should match 
// service_traits::DataType< ::j2n6s300_ml::tfQuery > 
template<>
struct DataType< ::j2n6s300_ml::tfQueryResponse>
{
  static const char* value()
  {
    return DataType< ::j2n6s300_ml::tfQuery >::value();
  }
  static const char* value(const ::j2n6s300_ml::tfQueryResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // J2N6S300_ML_MESSAGE_TFQUERY_H
