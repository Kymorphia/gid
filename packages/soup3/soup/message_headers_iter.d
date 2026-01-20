/// Module for [MessageHeadersIter] struct
module soup.message_headers_iter;

import gid.gid;
import soup.c.functions;
import soup.c.types;
import soup.message_headers;
import soup.types;

/**
    An opaque type used to iterate over a [soup.message_headers.MessageHeaders]
    structure.
    
    After intializing the iterator with [soup.message_headers_iter.MessageHeadersIter.init_], call
    [soup.message_headers_iter.MessageHeadersIter.next] to fetch data from it.
    
    You may not modify the headers while iterating over them.
*/
struct MessageHeadersIter
{
  /** */
  void*[3] dummy;

  /**
      Yields the next name/value pair in the `structMessageHeaders` being
      iterated by iter.
      
      If iter has already yielded the last header, then
      [soup.message_headers_iter.MessageHeadersIter.next] will return false and name and value
      will be unchanged.
  
      Params:
        name = pointer to a variable to return
            the header name in
        value = pointer to a variable to return
            the header value in
      Returns: true if another name and value were returned, false
          if the end of the headers has been reached.
  */
  bool next(out string name, out string value)
  {
    bool _retval;
    char* _name;
    char* _value;
    _retval = cast(bool)soup_message_headers_iter_next(cast(SoupMessageHeadersIter*)&this, &_name, &_value);
    name = _name.fromCString(No.Free);
    value = _value.fromCString(No.Free);
    return _retval;
  }

  /**
      Initializes iter for iterating hdrs.
  
      Params:
        iter = a pointer to a [soup.message_headers_iter.MessageHeadersIter]
            structure
        hdrs = a [soup.message_headers.MessageHeaders]
  */
  static void init_(out soup.message_headers_iter.MessageHeadersIter iter, soup.message_headers.MessageHeaders hdrs)
  {
    soup_message_headers_iter_init(cast(SoupMessageHeadersIter*)&iter, hdrs ? cast(SoupMessageHeaders*)hdrs._cPtr(No.Dup) : null);
  }
}
