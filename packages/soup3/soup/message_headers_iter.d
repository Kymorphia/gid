/// Module for [MessageHeadersIter] class
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
class MessageHeadersIter
{
  SoupMessageHeadersIter cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for soup.message_headers_iter.MessageHeadersIter");

    cInstance = *cast(SoupMessageHeadersIter*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

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
    _retval = cast(bool)soup_message_headers_iter_next(cast(SoupMessageHeadersIter*)this._cPtr, &_name, &_value);
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
    SoupMessageHeadersIter _iter;
    soup_message_headers_iter_init(&_iter, hdrs ? cast(SoupMessageHeaders*)hdrs._cPtr(No.Dup) : null);
    iter = new soup.message_headers_iter.MessageHeadersIter(cast(void*)&_iter, No.Take);
  }
}
