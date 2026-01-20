/// Module for [BuildableParseContext] class
module gtk.buildable_parse_context;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    An opaque context struct for [gtk.types.BuildableParser].
*/
class BuildableParseContext
{
  GtkBuildableParseContext* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.buildable_parse_context.BuildableParseContext");

    _cInstancePtr = cast(GtkBuildableParseContext*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Retrieves the name of the currently open element.
      
      If called from the start_element or end_element handlers this will
      give the element_name as passed to those functions. For the parent
      elements, see [gtk.buildable_parse_context.BuildableParseContext.getElementStack].
      Returns: the name of the currently open element
  */
  string getElement()
  {
    const(char)* _cretval;
    _cretval = gtk_buildable_parse_context_get_element(cast(GtkBuildableParseContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the element stack from the internal state of the parser.
      
      The returned [glib.ptr_array.PtrArray] is an array of strings where the last item is
      the currently open tag (as would be returned by
      [gtk.buildable_parse_context.BuildableParseContext.getElement]) and the previous item is its
      immediate parent.
      
      This function is intended to be used in the start_element and
      end_element handlers where [gtk.buildable_parse_context.BuildableParseContext.getElement]
      would merely return the name of the element that is being
      processed.
      Returns: the element stack, which must not be modified
  */
  string[] getElementStack()
  {
    GPtrArray* _cretval;
    _cretval = gtk_buildable_parse_context_get_element_stack(cast(GtkBuildableParseContext*)this._cPtr);
    auto _retval = gPtrArrayToD!(string, GidOwnership.None)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Retrieves the current line number and the number of the character on
      that line. Intended for use in error messages; there are no strict
      semantics for what constitutes the "current" line number other than
      "the best number we could come up with for error messages."
  
      Params:
        lineNumber = return location for a line number
        charNumber = return location for a char-on-line number
  */
  void getPosition(out int lineNumber, out int charNumber)
  {
    gtk_buildable_parse_context_get_position(cast(GtkBuildableParseContext*)this._cPtr, cast(int*)&lineNumber, cast(int*)&charNumber);
  }

  /**
      Completes the process of a temporary sub-parser redirection.
      
      This function exists to collect the user_data allocated by a
      matching call to [gtk.buildable_parse_context.BuildableParseContext.push]. It must be called
      in the end_element handler corresponding to the start_element
      handler during which [gtk.buildable_parse_context.BuildableParseContext.push] was called.
      You must not call this function from the error callback -- the
      user_data is provided directly to the callback in that case.
      
      This function is not intended to be directly called by users
      interested in invoking subparsers. Instead, it is intended to
      be used by the subparsers themselves to implement a higher-level
      interface.
      Returns: the user data passed to [gtk.buildable_parse_context.BuildableParseContext.push]
  */
  void* pop()
  {
    auto _retval = gtk_buildable_parse_context_pop(cast(GtkBuildableParseContext*)this._cPtr);
    return _retval;
  }

  /**
      Temporarily redirects markup data to a sub-parser.
      
      This function may only be called from the start_element handler of
      a [gtk.types.BuildableParser]. It must be matched with a corresponding call to
      [gtk.buildable_parse_context.BuildableParseContext.pop] in the matching end_element handler
      (except in the case that the parser aborts due to an error).
      
      All tags, text and other data between the matching tags is
      redirected to the subparser given by parser. user_data is used
      as the user_data for that parser. user_data is also passed to the
      error callback in the event that an error occurs. This includes
      errors that occur in subparsers of the subparser.
      
      The end tag matching the start tag for which this call was made is
      handled by the previous parser (which is given its own user_data)
      which is why [gtk.buildable_parse_context.BuildableParseContext.pop] is provided to allow "one
      last access" to the user_data provided to this function. In the
      case of error, the user_data provided here is passed directly to
      the error callback of the subparser and [gtk.buildable_parse_context.BuildableParseContext.pop]
      should not be called. In either case, if user_data was allocated
      then it ought to be freed from both of these locations.
      
      This function is not intended to be directly called by users
      interested in invoking subparsers. Instead, it is intended to be
      used by the subparsers themselves to implement a higher-level
      interface.
      
      For an example of how to use this, see [glib.markup_parse_context.MarkupParseContext.push] which
      has the same kind of API.
  
      Params:
        parser = a [gtk.types.BuildableParser]
        userData = user data to pass to [gtk.types.BuildableParser] functions
  */
  void push(gtk.types.BuildableParser parser, void* userData = null)
  {
    gtk_buildable_parse_context_push(cast(GtkBuildableParseContext*)this._cPtr, &parser, userData);
  }
}
