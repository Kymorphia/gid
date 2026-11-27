/// Module for [TextTagTable] class
module gid.gtk3.text_tag_table;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.text_tag;
import gid.gtk3.types;

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and
    data types related to the text widget and how they work together.
    
    # GtkTextTagTables as GtkBuildable
    
    The GtkTextTagTable implementation of the GtkBuildable interface
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
@gidGir("TextTagTable", "TextTagTableClass")
class TextTagTable : gid.gobject2.object.ObjectWrap, gid.gtk3.buildable.Buildable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_tag_table_get_type != &gidSymbolNotFound ? gtk_text_tag_table_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTextTagTable";
  }

  /** Returns `this`, for use in `with` statements. */
  override TextTagTable self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.text_tag_table.TextTagTable]
      Returns: New builder object
  */
  static TextTagTableGidBuilder builder() nothrow
  {
    return new TextTagTableGidBuilder;
  }

  mixin BuildableT!();

  /**
      Creates a new #GtkTextTagTable. The table contains no tags by
      default.
      Returns: a new #GtkTextTagTable
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkTextTagTable* _cretval;
      _cretval = gtk_text_tag_table_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncTagAdded(gid.gtk3.text_tag.TextTag tag)
  {
    auto _klass = cast(GtkTextTagTableClass*)_vfuncClass;
    if (!_klass.tagAdded)
      return;

    _klass.tagAdded(cast(GtkTextTagTable*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncTagChanged(gid.gtk3.text_tag.TextTag tag, bool sizeChanged)
  {
    auto _klass = cast(GtkTextTagTableClass*)_vfuncClass;
    if (!_klass.tagChanged)
      return;

    _klass.tagChanged(cast(GtkTextTagTable*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null, sizeChanged);
  }

  /** */
  protected void vfuncTagRemoved(gid.gtk3.text_tag.TextTag tag)
  {
    auto _klass = cast(GtkTextTagTableClass*)_vfuncClass;
    if (!_klass.tagRemoved)
      return;

    _klass.tagRemoved(cast(GtkTextTagTable*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
  }

  /**
      Add a tag to the table. The tag is assigned the highest priority
      in the table.
      
      tag must not be in a tag table already, and may not have
      the same name as an already-added tag.
  
      Params:
        tag = a #GtkTextTag
      Returns: true on success.
  */
  bool add(gid.gtk3.text_tag.TextTag tag) nothrow
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
  void foreach_(gid.gtk3.types.TextTagTableForeach func) nothrow
  {
    extern(C) void _funcCallback(GtkTextTag* tag, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.TextTagTableForeach*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_tag.TextTag)(cast(void*)tag, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TextTagTableForeach");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_text_tag_table_foreach(cast(GtkTextTagTable*)this._cPtr, _funcCB, _func);
  }

  /**
      Returns the size of the table (number of tags)
      Returns: number of tags in table
  */
  int getSize() nothrow
  {
    int _retval;
    _retval = gtk_text_tag_table_get_size(cast(GtkTextTagTable*)this._cPtr);
    return _retval;
  }

  /**
      Look up a named tag.
  
      Params:
        name = name of a tag
      Returns: The tag, or null if none by that
        name is in the table.
  */
  gid.gtk3.text_tag.TextTag lookup(string name) nothrow
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_text_tag_table_lookup(cast(GtkTextTagTable*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_tag.TextTag)(cast(GtkTextTag*)_cretval, No.Take);
    return _retval;
  }

  /**
      Remove a tag from the table. If a #GtkTextBuffer has table as its tag table,
      the tag is removed from the buffer. The table’s reference to the tag is
      removed, so the tag will end up destroyed if you don’t have a reference to
      it.
  
      Params:
        tag = a #GtkTextTag
  */
  void remove(gid.gtk3.text_tag.TextTag tag) nothrow
  {
    gtk_text_tag_table_remove(cast(GtkTextTagTable*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
  }

  /**
      Connect to `TagAdded` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_tag.TextTag tag, gid.gtk3.text_tag_table.TextTagTable textTagTable)`
  
          `tag` the added tag. (optional)
  
          `textTagTable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTagAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_tag_table.TextTagTable)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_tag_table.TextTagTable.tagAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-added", closure, after);
  }

  /**
      Connect to `TagChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_tag.TextTag tag, bool sizeChanged, gid.gtk3.text_tag_table.TextTagTable textTagTable)`
  
          `tag` the changed tag. (optional)
  
          `sizeChanged` whether the change affects the #GtkTextView layout. (optional)
  
          `textTagTable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTagChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.text_tag_table.TextTagTable)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_tag_table.TextTagTable.tagChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-changed", closure, after);
  }

  /**
      Connect to `TagRemoved` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_tag.TextTag tag, gid.gtk3.text_tag_table.TextTagTable textTagTable)`
  
          `tag` the removed tag. (optional)
  
          `textTagTable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTagRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.text_tag.TextTag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.text_tag_table.TextTagTable)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_tag_table.TextTagTable.tagRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tag-removed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TextTagTable
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.text_tag_table.TextTagTable), T.stringof ~ " is not derived from gid.gtk3.text_tag_table.TextTagTable");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTagAdded", true)[0]) == gid.gtk3.text_tag_table.TextTagTable))
      _installVfunc(klass, "tag_added");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTagChanged", true)[0]) == gid.gtk3.text_tag_table.TextTagTable))
      _installVfunc(klass, "tag_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTagRemoved", true)[0]) == gid.gtk3.text_tag_table.TextTagTable))
      _installVfunc(klass, "tag_removed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkTextTagTableClass*)klass;

    switch (vfunc)
    {
      case "tag_added":
      {
        static extern(C) void _vfuncTagAddedTramp(GtkTextTagTable* table, GtkTextTag* tag) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.text_tag_table.TextTagTable)(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(GtkTextTagTableClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table);
            if (_klass.tagAdded)
              return (cast(typeof(&_vfuncTagAddedTramp))_klass.tagAdded)(table, tag);
            return;
          }

          try
          {
            _obj.vfuncTagAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_tag.TextTag)(cast(void*)tag, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_tag_table.TextTagTable.vfuncTagAdded");
          }
        }

        _klass.tagAdded = cast(typeof(_klass.tagAdded))&_vfuncTagAddedTramp;
        break;
      }
      case "tag_changed":
      {
        static extern(C) void _vfuncTagChangedTramp(GtkTextTagTable* table, GtkTextTag* tag, gboolean sizeChanged) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.text_tag_table.TextTagTable)(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(GtkTextTagTableClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table);
            if (_klass.tagChanged)
              return (cast(typeof(&_vfuncTagChangedTramp))_klass.tagChanged)(table, tag, sizeChanged);
            return;
          }

          try
          {
            _obj.vfuncTagChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_tag.TextTag)(cast(void*)tag, No.Take), cast(bool)sizeChanged);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_tag_table.TextTagTable.vfuncTagChanged");
          }
        }

        _klass.tagChanged = cast(typeof(_klass.tagChanged))&_vfuncTagChangedTramp;
        break;
      }
      case "tag_removed":
      {
        static extern(C) void _vfuncTagRemovedTramp(GtkTextTagTable* table, GtkTextTag* tag) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.text_tag_table.TextTagTable)(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(GtkTextTagTableClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table);
            if (_klass.tagRemoved)
              return (cast(typeof(&_vfuncTagRemovedTramp))_klass.tagRemoved)(table, tag);
            return;
          }

          try
          {
            _obj.vfuncTagRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_tag.TextTag)(cast(void*)tag, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.text_tag_table.TextTagTable.vfuncTagRemoved");
          }
        }

        _klass.tagRemoved = cast(typeof(_klass.tagRemoved))&_vfuncTagRemovedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.text_tag_table.TextTagTable]
class TextTagTableGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk3.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.text_tag_table.TextTagTable]
final class TextTagTableGidBuilder : TextTagTableGidBuilderImpl!TextTagTableGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TextTagTable build() nothrow
  {
    return new TextTagTable(cast(void*)createGObject(TextTagTable._getGType), Yes.Take);
  }
}
