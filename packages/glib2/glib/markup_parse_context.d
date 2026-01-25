/// Module for [MarkupParseContext] class
module glib.markup_parse_context;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.types;
import gobject.boxed;

/**
    A parse context is used to parse a stream of bytes that
    you expect to contain marked-up text.
    
    See [glib.markup_parse_context.MarkupParseContext.new_], #GMarkupParser, and so
    on for more details.
*/
class MarkupParseContext : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_markup_parse_context_get_type != &gidSymbolNotFound ? g_markup_parse_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MarkupParseContext self()
  {
    return this;
  }

  /** */
  this(ref MarkupParser parser, MarkupParseFlags flags)
  {
    GMarkupParseContext* _cretval;
    GMarkupParseFlags _flags = cast(GMarkupParseFlags)cast(uint)flags;
    _cretval = g_markup_parse_context_new(&parser, _flags, null, null);
    this(_cretval, Yes.Take);
  }


  /**
      Signals to the #GMarkupParseContext that all data has been
      fed into the parse context with [glib.markup_parse_context.MarkupParseContext.parse].
      
      This function reports an error if the document isn't complete,
      for example if elements are still open.
      Returns: true on success, false if an error was set
      Throws: [ErrorWrap]
  */
  bool endParse()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_markup_parse_context_end_parse(cast(GMarkupParseContext*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Retrieves the name of the currently open element.
      
      If called from the start_element or end_element handlers this will
      give the element_name as passed to those functions. For the parent
      elements, see [glib.markup_parse_context.MarkupParseContext.getElementStack].
      Returns: the name of the currently open element, or null
  */
  string getElement()
  {
    const(char)* _cretval;
    _cretval = g_markup_parse_context_get_element(cast(GMarkupParseContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the element stack from the internal state of the parser.
      
      The returned #GSList is a list of strings where the first item is
      the currently open tag (as would be returned by
      [glib.markup_parse_context.MarkupParseContext.getElement]) and the next item is its
      immediate parent.
      
      This function is intended to be used in the start_element and
      end_element handlers where [glib.markup_parse_context.MarkupParseContext.getElement]
      would merely return the name of the element that is being
      processed.
      Returns: the element stack, which must not be modified
  */
  string[] getElementStack()
  {
    const(GSList)* _cretval;
    _cretval = g_markup_parse_context_get_element_stack(cast(GMarkupParseContext*)this._cPtr);
    auto _retval = gSListToD!(string, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Retrieves the current line number and the number of the character on
      that line. Intended for use in error messages; there are no strict
      semantics for what constitutes the "current" line number other than
      "the best number we could come up with for error messages."
  
      Params:
        lineNumber = return location for a line number, or null
        charNumber = return location for a char-on-line number, or null
  */
  void getPosition(out int lineNumber, out int charNumber)
  {
    g_markup_parse_context_get_position(cast(GMarkupParseContext*)this._cPtr, cast(int*)&lineNumber, cast(int*)&charNumber);
  }

  /**
      Returns the user_data associated with context.
      
      This will either be the user_data that was provided to
      [glib.markup_parse_context.MarkupParseContext.new_] or to the most recent call
      of [glib.markup_parse_context.MarkupParseContext.push].
      Returns: the provided user_data. The returned data belongs to
            the markup context and will be freed when
            [glib.markup_parse_context.MarkupParseContext.free] is called.
  */
  void* getUserData()
  {
    auto _retval = g_markup_parse_context_get_user_data(cast(GMarkupParseContext*)this._cPtr);
    return _retval;
  }

  /**
      Feed some data to the #GMarkupParseContext.
      
      The data need not be valid UTF-8; an error will be signaled if
      it's invalid. The data need not be an entire document; you can
      feed a document into the parser incrementally, via multiple calls
      to this function. Typically, as you receive data from a network
      connection or file, you feed each received chunk of data into this
      function, aborting the process if an error occurs. Once an error
      is reported, no further data may be fed to the #GMarkupParseContext;
      all errors are fatal.
  
      Params:
        text = chunk of text to parse
      Returns: false if an error occurred, true on success
      Throws: [ErrorWrap]
  */
  bool parse(string text)
  {
    bool _retval;
    ptrdiff_t _textLen;
    if (text)
      _textLen = cast(ptrdiff_t)text.length;

    auto _text = cast(const(char)*)text.ptr;
    GError *_err;
    _retval = cast(bool)g_markup_parse_context_parse(cast(GMarkupParseContext*)this._cPtr, _text, _textLen, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Completes the process of a temporary sub-parser redirection.
      
      This function exists to collect the user_data allocated by a
      matching call to [glib.markup_parse_context.MarkupParseContext.push]. It must be called
      in the end_element handler corresponding to the start_element
      handler during which [glib.markup_parse_context.MarkupParseContext.push] was called.
      You must not call this function from the error callback -- the
      user_data is provided directly to the callback in that case.
      
      This function is not intended to be directly called by users
      interested in invoking subparsers. Instead, it is intended to
      be used by the subparsers themselves to implement a higher-level
      interface.
      Returns: the user data passed to [glib.markup_parse_context.MarkupParseContext.push]
  */
  void* pop()
  {
    auto _retval = g_markup_parse_context_pop(cast(GMarkupParseContext*)this._cPtr);
    return _retval;
  }

  /**
      Temporarily redirects markup data to a sub-parser.
      
      This function may only be called from the start_element handler of
      a #GMarkupParser. It must be matched with a corresponding call to
      [glib.markup_parse_context.MarkupParseContext.pop] in the matching end_element handler
      (except in the case that the parser aborts due to an error).
      
      All tags, text and other data between the matching tags is
      redirected to the subparser given by parser. user_data is used
      as the user_data for that parser. user_data is also passed to the
      error callback in the event that an error occurs. This includes
      errors that occur in subparsers of the subparser.
      
      The end tag matching the start tag for which this call was made is
      handled by the previous parser (which is given its own user_data)
      which is why [glib.markup_parse_context.MarkupParseContext.pop] is provided to allow "one
      last access" to the user_data provided to this function. In the
      case of error, the user_data provided here is passed directly to
      the error callback of the subparser and [glib.markup_parse_context.MarkupParseContext.pop]
      should not be called. In either case, if user_data was allocated
      then it ought to be freed from both of these locations.
      
      This function is not intended to be directly called by users
      interested in invoking subparsers. Instead, it is intended to be
      used by the subparsers themselves to implement a higher-level
      interface.
      
      As an example, see the following implementation of a simple
      parser that counts the number of tags encountered.
      
      ```c
      typedef struct
      {
        gint tag_count;
      } CounterData;
      
      static void
      counter_start_element (GMarkupParseContext  *context,
                             const gchar          *element_name,
                             const gchar         **attribute_names,
                             const gchar         **attribute_values,
                             gpointer              user_data,
                             GError              **error)
      {
        CounterData *data = user_data;
      
        data->tag_count++;
      }
      
      static void
      counter_error (GMarkupParseContext *context,
                     GError              *error,
                     gpointer             user_data)
      {
        CounterData *data = user_data;
      
        g_slice_free (CounterData, data);
      }
      
      static GMarkupParser counter_subparser =
      {
        counter_start_element,
        NULL,
        NULL,
        NULL,
        counter_error
      };
      ```
      
      In order to allow this parser to be easily used as a subparser, the
      following interface is provided:
      
      ```c
      void
      start_counting (GMarkupParseContext *context)
      {
        CounterData *data = g_slice_new (CounterData);
      
        data->tag_count = 0;
        g_markup_parse_context_push (context, &counter_subparser, data);
      }
      
      gint
      end_counting (GMarkupParseContext *context)
      {
        CounterData *data = g_markup_parse_context_pop (context);
        int result;
      
        result = data->tag_count;
        g_slice_free (CounterData, data);
      
        return result;
      }
      ```
      
      The subparser would then be used as follows:
      
      ```c
      static void start_element (context, element_name, ...)
      {
        if (strcmp (element_name, "count-these") == 0)
          start_counting (context);
      
        // else, handle other tags...
      }
      
      static void end_element (context, element_name, ...)
      {
        if (strcmp (element_name, "count-these") == 0)
          g_print ("Counted %d tags\n", end_counting (context));
      
        // else, handle other tags...
      }
      ```
  
      Params:
        parser = a #GMarkupParser
        userData = user data to pass to #GMarkupParser functions
  */
  void push(glib.types.MarkupParser parser, void* userData = null)
  {
    g_markup_parse_context_push(cast(GMarkupParseContext*)this._cPtr, &parser, userData);
  }
}
