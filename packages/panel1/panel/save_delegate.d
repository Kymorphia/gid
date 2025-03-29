module panel.save_delegate;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.icon;
import gio.task;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class SaveDelegate : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_save_delegate_get_type != &gidSymbolNotFound ? panel_save_delegate_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override SaveDelegate self()
  {
    return this;
  }

  /**
      Create a new #PanelSaveDelegate.
      Returns: a newly created #PanelSaveDelegate
  */
  this()
  {
    PanelSaveDelegate* _cretval;
    _cretval = panel_save_delegate_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void close()
  {
    panel_save_delegate_close(cast(PanelSaveDelegate*)cPtr);
  }

  /** */
  void discard()
  {
    panel_save_delegate_discard(cast(PanelSaveDelegate*)cPtr);
  }

  /**
      Gets the #GIcon for the save delegate, or null if unset.
      Returns: a #GIcon or null
  */
  gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = panel_save_delegate_get_icon(cast(PanelSaveDelegate*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name for the save delegate.
      Returns: the icon name or null
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = panel_save_delegate_get_icon_name(cast(PanelSaveDelegate*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  bool getIsDraft()
  {
    bool _retval;
    _retval = panel_save_delegate_get_is_draft(cast(PanelSaveDelegate*)cPtr);
    return _retval;
  }

  /** */
  double getProgress()
  {
    double _retval;
    _retval = panel_save_delegate_get_progress(cast(PanelSaveDelegate*)cPtr);
    return _retval;
  }

  /**
      Gets the subtitle for the save delegate.
      Returns: the subtitle or null
  */
  string getSubtitle()
  {
    const(char)* _cretval;
    _cretval = panel_save_delegate_get_subtitle(cast(PanelSaveDelegate*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the title for the save delegate.
      Returns: the title or null
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = panel_save_delegate_get_title(cast(PanelSaveDelegate*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  void saveAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_save_delegate_save_async(cast(PanelSaveDelegate*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool saveFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = panel_save_delegate_save_finish(cast(PanelSaveDelegate*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Sets the #GIcon for the save delegate. Pass null to unset.
  
      Params:
        icon = a #GIcon or null
  */
  void setIcon(gio.icon.Icon icon = null)
  {
    panel_save_delegate_set_icon(cast(PanelSaveDelegate*)cPtr, icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name for the save delegate. Pass null to unset.
  
      Params:
        icon = the icon name or null
  */
  void setIconName(string icon = null)
  {
    const(char)* _icon = icon.toCString(No.Alloc);
    panel_save_delegate_set_icon_name(cast(PanelSaveDelegate*)cPtr, _icon);
  }

  /** */
  void setIsDraft(bool isDraft)
  {
    panel_save_delegate_set_is_draft(cast(PanelSaveDelegate*)cPtr, isDraft);
  }

  /** */
  void setProgress(double progress)
  {
    panel_save_delegate_set_progress(cast(PanelSaveDelegate*)cPtr, progress);
  }

  /**
      Sets the subtitle for the save delegate. Pass null to unset.
  
      Params:
        subtitle = the subtitle or null
  */
  void setSubtitle(string subtitle = null)
  {
    const(char)* _subtitle = subtitle.toCString(No.Alloc);
    panel_save_delegate_set_subtitle(cast(PanelSaveDelegate*)cPtr, _subtitle);
  }

  /**
      Sets the title for the save delegate. Pass null to unset.
  
      Params:
        title = the title or null
  */
  void setTitle(string title = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    panel_save_delegate_set_title(cast(PanelSaveDelegate*)cPtr, _title);
  }

  /**
      Connect to `Close` signal.
  
      This signal is emitted when the save delegate should close
      the widget it is related to. This can happen after saving as
      part of a close request and it is now save for the delegate to
      close.
      
      Implementations are encouraged to connect to this signal (or
      implement the virtual method) and call [panel.widget.Widget.forceClose].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(panel.save_delegate.SaveDelegate saveDelegate))
  
          `saveDelegate` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.save_delegate.SaveDelegate)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close", closure, after);
  }

  /**
      Connect to `Discard` signal.
  
      This signal is emitted when the user has requested that the
      delegate discard the changes instead of saving them.
      
      Implementations are encouraged to connect to this signal (or
      implement the virtual method) and revert the document to the
      last saved state and/or close the document.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(panel.save_delegate.SaveDelegate saveDelegate))
  
          `saveDelegate` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDiscard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.save_delegate.SaveDelegate)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("discard", closure, after);
  }

  /**
      Connect to `Save` signal.
  
      This signal can be used when subclassing #PanelSaveDelegate is not
      possible or cumbersome. The default implementation of
      #PanelSaveDelegateClass.save_async() will emit this signal to allow
      the consumer to implement asynchronous save in a flexible manner.
      
      The caller is expected to complete task with a boolean when the
      save operation has completed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.task.Task task, panel.save_delegate.SaveDelegate saveDelegate))
  
          `task` a #GTask (optional)
  
          `saveDelegate` the instance the signal is connected to (optional)
  
          `Returns` true if the operation was handled.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSave(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.task.Task)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.save_delegate.SaveDelegate)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("save", closure, after);
  }
}
