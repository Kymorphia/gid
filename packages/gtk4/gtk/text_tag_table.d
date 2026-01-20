/// Module for [TextTagTable] class
module gtk.text_tag_table;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_tag;
import gtk.types;

/**
    The collection of tags in a [gtk.text_buffer.TextBuffer]
    
    You may wish to begin by reading the
    [text widget conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types
    related to the text widget and how they work together.
    
    # GtkTextTagTables as GtkBuildable
    
    The [gtk.text_tag_table.TextTagTable] implementation of the [gtk.buildable.Buildable] interface
    supports adding tags by specifying “tag” as the “type” attribute
    of a `<child>` element.
    
    An example of a UI definition fragment specifying tags:
    ```xml
    <object class="GtkTextTagTable">
     <child type="tag">
       <object class="GtkTextTag"/>
     </child>
    </object>
    ```
*/
class TextTagTable : gobject.object.ObjectWrap, gtk.buildable.Buildable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_tag_table_get_type != &gidSymbolNotFound ? gtk_text_tag_table_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextTagTable self()
  {
    return this;
  }

  mixin BuildableT!();

  /**
      Creates a new [gtk.text_tag_table.TextTagTable].
      
      The table contains no tags by default.
      Returns: a new [gtk.text_tag_table.TextTagTable]
  */
  this()
  {
    GtkTextTagTable* _cretval;
    _cretval = gtk_text_tag_table_new();
    this(_cretval, Yes.Take);
  }

  /**
      Add a tag to the table.
      
      The tag is assigned the highest priority in the table.
      
      tag must not be in a tag table already, and may not have
      the same name as an already-added tag.
  
      Params:
        tag = a [gtk.text_tag.TextTag]
      Returns: true on success.
  */
  bool add(gtk.text_tag.TextTag tag)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_tag_table_add(cast(GtkTextTagTable*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calls func on each tag in table, with user data data.
      
      Note that the table may not be modified while iterating
      over it (you can’t add/remove tags).
  
      Params:
        func = a function to call on each tag
  */
  void foreach_(gtk.types.TextTagTableForeach func)
  {
    extern(C) void _funcCallback(GtkTextTag* tag, void* data)
    {
      auto _dlg = cast(gtk.types.TextTagTableForeach*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.text_tag.TextTag)(cast(void*)tag, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_text_tag_table_foreach(cast(GtkTextTagTable*)this._cPtr, _funcCB, _func);
  }

  /**
      Returns the size of the table (number of tags)
      Returns: number of tags in table
  */
  int getSize()
  {
    int _retval;
    _retval = gtk_text_tag_table_get_size(cast(GtkTextTagTable*)this._cPtr);
    return _retval;
  }

  /**
      Look up a named tag.
  
      Params:
        name = name of a tag
      Returns: The tag
  */
  gtk.text_tag.TextTag lookup(string name)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_text_tag_table_lookup(cast(GtkTextTagTable*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_tag.TextTag)(cast(GtkTextTag*)_cretval, No.Take);
    return _retval;
  }

  /**
      Remove a tag from the table.
      
      If a [gtk.text_buffer.TextBuffer] has table as its tag table, the tag is
      removed from the buffer. The table’s reference to the tag is
      removed, so the tag will end up destroyed if you don’t have
      a reference to it.
  
      Params:
        tag = a [gtk.text_tag.TextTag]
  */
  void remove(gtk.text_tag.TextTag tag)
  {
    gtk_text_tag_table_remove(cast(GtkTextTagTable*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
  }

  /**
      Connect to `TagAdded` signal.
  
      Emitted every time a new tag is added in the [gtk.text_tag_table.TextTagTable].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable))
  
          `tag` the added tag. (optional)
  
          `textTagTable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectTagAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text_tag_table.TextTagTable)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-added", closure, after);
  }

  /**
      Connect to `TagChanged` signal.
  
      Emitted every time a tag in the [gtk.text_tag_table.TextTagTable] changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_tag.TextTag tag, bool sizeChanged, gtk.text_tag_table.TextTagTable textTagTable))
  
          `tag` the changed tag. (optional)
  
          `sizeChanged` whether the change affects the [gtk.text_view.TextView] layout. (optional)
  
          `textTagTable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectTagChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.text_tag_table.TextTagTable)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-changed", closure, after);
  }

  /**
      Connect to `TagRemoved` signal.
  
      Emitted every time a tag is removed from the [gtk.text_tag_table.TextTagTable].
        
        The tag is still valid by the time the signal is emitted, but
        it is not associated with a tag table any more.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_tag.TextTag tag, gtk.text_tag_table.TextTagTable textTagTable))
  
          `tag` the removed tag. (optional)
  
          `textTagTable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectTagRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.text_tag_table.TextTagTable)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-removed", closure, after);
  }
}
